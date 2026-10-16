#!/usr/bin/env bash
# 辅助：清理运行目录。默认只清理 runtime 子目录，保留 meta/output 供排查。
set +e

source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
load_local_env

workdir="${LOCAL_RUN_DIR:-$PROJECT_DIR/.run}"
safe_build_tag="${LOCAL_BUILD_TAG//[^A-Za-z0-9_.-]/_}"
runtime_dir="$workdir/runtime/$safe_build_tag"

if [[ -z "$safe_build_tag" ]]; then
  # 未指定 BUILD_TAG 时清理整个 runtime 目录
  rm -rf "$workdir/runtime"
  exit 0
fi

if [[ "$LOCAL_CLEAN_ALL" == "1" ]]; then
  rm -rf "$workdir"
else
  if [[ -n "$safe_build_tag" && "$runtime_dir" == "$workdir/runtime/"* ]]; then
    rm -rf "$runtime_dir"
  fi
fi
