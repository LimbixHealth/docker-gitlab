#!/bin/bash
repo_hashed_path="$1"
repo_path="/home/git/data/repositories/${repo_hashed_path}"
custom_hooks_path="${repo_path}/custom_hooks"

mkdir ${custom_hooks_path}

cp post-receive-script.sh ${repo_path}
chmod u+x "${repo_path}/post-receive-script.sh"

cp post-receive ${custom_hooks_path}
chown git:git "${custom_hooks_path}/post-receive"
chmod u+x "${custom_hooks_path}/post-receive"

cp pre-receive ${custom_hooks_path}
chown git:git "${custom_hooks_path}/pre-receive"
chmod u+x "${custom_hooks_path}/pre-receive"
