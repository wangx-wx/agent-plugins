/**
 * 通用 Git Diff 包装脚本
 *
 * 执行 git diff {target}...{source} -- <pathspecs>，输出原始 diff 结果。
 * 供 Java Code Review Skill 的 Agent 2/3/4 统一调用。
 *
 * 用法:
 *   node git_diff.mjs <repo> --source <branch> --target <branch> [-- pathspec ...]
 *
 * 示例:
 *   # Agent 2: Java 文件（排除测试）
 *   node git_diff.mjs /repo --source feat/x --target origin/master -- "*.java" ":(exclude)*\/src/test/*"
 *
 *   # Agent 3: 配置文件（排除 java/xml/md）
 *   node git_diff.mjs /repo --source feat/x --target origin/master -- ":(exclude)*.java" ":(exclude)*.xml" ":(exclude)*.md"
 *
 *   # Agent 4: XML 文件（排除 pom.xml）
 *   node git_diff.mjs /repo --source feat/x --target origin/master -- "*.xml" ":(exclude)*pom.xml"
 *
 *   # 无 pathspec，获取全部变更
 *   node git_diff.mjs /repo --source feat/x --target origin/master
 */

import { execFileSync } from "node:child_process";
import { resolve, isAbsolute } from "node:path";
import { statSync } from "node:fs";

// ---------------------------------------------------------------------------
// 参数解析
// ---------------------------------------------------------------------------

function parseArgs(argv) {
  // 分割 -- 前后的参数
  const ddIdx = argv.indexOf("--");
  const scriptArgs = ddIdx >= 0 ? argv.slice(0, ddIdx) : argv;
  const pathspecs = ddIdx >= 0 ? argv.slice(ddIdx + 1) : [];

  let repo = null;
  let source = null;
  let target = "origin/master";

  for (let i = 0; i < scriptArgs.length; i++) {
    if (scriptArgs[i] === "--source" && i + 1 < scriptArgs.length) {
      source = scriptArgs[++i];
    } else if (scriptArgs[i] === "--target" && i + 1 < scriptArgs.length) {
      target = scriptArgs[++i];
    } else if (!repo && !scriptArgs[i].startsWith("--")) {
      repo = scriptArgs[i];
    }
  }

  if (!repo) {
    console.error("错误: 缺少必需参数 <repo>");
    process.exit(1);
  }
  if (!source) {
    console.error("错误: 缺少必需参数 --source");
    process.exit(1);
  }

  return { repo, source, target, pathspecs };
}

// ---------------------------------------------------------------------------
// 验证函数
// ---------------------------------------------------------------------------

function validateRepo(repoPath) {
  const absPath = isAbsolute(repoPath) ? repoPath : resolve(repoPath);
  try {
    const stat = statSync(absPath);
    if (!stat.isDirectory()) {
      console.error(`路径不是目录: ${absPath}`);
      process.exit(1);
    }
  } catch {
    console.error(`路径不存在: ${absPath}`);
    process.exit(1);
  }

  try {
    execFileSync("git", ["-C", absPath, "rev-parse", "--git-dir"], {
      stdio: ["pipe", "pipe", "pipe"],
    });
  } catch {
    console.error(`不是有效的 Git 仓库: ${absPath}`);
    process.exit(1);
  }

  return absPath;
}

function validateBranch(repo, branch) {
  try {
    execFileSync("git", ["-C", repo, "rev-parse", "--verify", branch], {
      stdio: ["pipe", "pipe", "pipe"],
    });
  } catch (err) {
    const stderr = err.stderr ? err.stderr.toString().trim() : "";
    console.error(`分支不存在: ${branch}\n  ${stderr}`);
    process.exit(1);
  }
}

// ---------------------------------------------------------------------------
// Git diff 执行
// ---------------------------------------------------------------------------

function gitDiff(repo, source, target, pathspecs) {
  const cmd = ["-C", repo, "diff", `${target}...${source}`];
  if (pathspecs.length > 0) {
    cmd.push("--");
    cmd.push(...pathspecs);
  }

  try {
    const stdout = execFileSync("git", cmd, {
      maxBuffer: 50 * 1024 * 1024, // 50 MB
    });
    return stdout.toString("utf-8");
  } catch (err) {
    const stderr = err.stderr ? err.stderr.toString().trim() : err.message;
    console.error(`git diff 执行失败:\n  ${stderr}`);
    process.exit(1);
  }
}

// ---------------------------------------------------------------------------
// 主流程
// ---------------------------------------------------------------------------

const args = parseArgs(process.argv.slice(2));
const repo = validateRepo(args.repo);
validateBranch(repo, args.source);
validateBranch(repo, args.target);

const output = gitDiff(repo, args.source, args.target, args.pathspecs);
if (output) {
  process.stdout.write(output);
} else {
  console.error("无变更内容。");
}
