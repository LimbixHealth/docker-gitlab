#!/bin/bash
set -x
REPO_URL="ssh://git@192.168.86.132:10022/root/limbix-content.git"
NAS_CONTENT_DIR="/NAS-content"

branch_name="$1"
repo_dir="${NAS_CONTENT_DIR}/${branch_name}"

if [ -d $repo_dir ]
then
  git --work-tree="${repo_dir}" --git-dir="${repo_dir}"/.git pull origin "$branch_name"
else
  git clone -b $branch_name --single-branch $REPO_URL $repo_dir --depth 1
  git --work-tree="${repo_dir}" --git-dir="${repo_dir}"/.git lfs install
fi

git --work-tree="${repo_dir}" --git-dir="${repo_dir}"/.git lfs pull origin "$branch_name"

rm "${branch_name}.lock"
