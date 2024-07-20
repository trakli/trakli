#!/bin/bash

# Sync each repository of interest to the latest version
# and ensures the default branch is called main

set -euo pipefail

if [[ $# -ne 0 ]]; then
	echo "usage: $0" 1>&2
	exit 1
fi

source ./tools/libgit.bash

# Setup the webservice
maybe_setup_webservice() {
	dirname=$(repo_to_dir $1)
	# check if the repo is a webservice
	[[ $dirname == *"webservice"* ]] || return 0
	run echo "Running setup for $dirname"
	(run cd $dirname && cp .env.example .env)
	(run cd $dirname && docker compose up -d)
	(run cd $dirname && docker compose exec app composer install)
	(run cd $dirname && docker compose exec app php artisan key:generate)
	(run cd $dirname && docker compose exec app php artisan migrate --seed)
}

# Setup the web frontend
maybe_setup_web_frontend() {
	dirname=$(repo_to_dir $1)
	# check if the repo is a webservice
	[[ $dirname == *"ui"* ]] || return 0
	(run echo "Running setup for $dirname")
	(run cd $dirname && docker compose up -d)
	(run cd $dirname && docker compose exec app sh -c "npm install")
	(run cd $dirname && docker compose exec app sh -c "npm run dev")
}

# Setup all services
do_setup_and_run() {
	maybe_setup_webservice $1
	maybe_setup_web_frontend $1
}

for_each_repo do_setup_and_run