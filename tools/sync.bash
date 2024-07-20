#!/bin/bash

# Sync each repository of interest to the latest version
# and ensures the default branch is called main

set -euo pipefail

if [[ $# -ne 0 ]]; then
	echo "usage: $0" 1>&2
	exit 1
fi

source ./tools/libgit.bash

maybe_clone() {
	dirname=$(repo_to_dir $1)
	[[ -d $dirname ]] || {
		run git clone -q $1 $dirname
		(run cd $dirname && run git branch -m main)
	}
}

maybe_pull() {
	dirname=$(repo_to_dir $1)
	(run cd $dirname && run git pull)
}

prune_remote_branches() {
	dirname=$(repo_to_dir $1)
	(run cd $dirname && run git remote prune origin)
}

do_sync_and_prune() {
	maybe_clone $1
	maybe_pull $1
	prune_remote_branches $1
}

for_each_repo do_sync_and_prune