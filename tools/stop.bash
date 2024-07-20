#!/bin/bash

# Sync each repository of interest to the latest version
# and ensures the default branch is called main

set -euo pipefail

if [[ $# -ne 0 ]]; then
	echo "usage: $0" 1>&2
	exit 1
fi

source ./tools/libgit.bash

# Stop the webservice
maybe_stop_webservice() {
	dirname=$(repo_to_dir $1)
	# check if the repo is a webservice
	[[ $dirname == *"webservice"* ]] || return 0
	run echo "Running stop for $dirname"
	(run cd $dirname && docker compose stop)
}

# Stop the web frontend
maybe_stop_web_frontend() {
	dirname=$(repo_to_dir $1)
	# check if the repo is a webservice
	[[ $dirname == *"ui"* ]] || return 0
	(run echo "Running setup for $dirname")
	(run cd $dirname && docker compose stop)
}

# Stop all services
do_stop() {
	maybe_stop_webservice $1
	maybe_stop_web_frontend $1
}

for_each_repo do_stop