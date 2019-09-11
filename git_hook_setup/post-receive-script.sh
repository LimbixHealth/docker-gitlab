#!/bin/bash
REPO_URL="ssh://git@192.168.86.132:10022/root/limbix-content.git"
NAS_CONTENT_DIR="/NAS-content"

branch_name="$1"
repo_dir="${NAS_CONTENT_DIR}/${branch_name}"

# store current path so it can be returned to later
cur_path=$(pwd)

if [ -d $repo_dir ]
then
  # pull from branch
  cd ${repo_dir}
  git pull origin "$branch_name"
else
  # clone branch
  git clone -b $branch_name --single-branch $REPO_URL $repo_dir --depth 1
  cd ${repo_dir}
  git lfs install
fi

# pull all files
git lfs pull origin "$branch_name"

# return to original working directory and remove lock file
cd ${cur_path}
rm "${branch_name}.lock"
