source ./config/lib.bash

run() {
	echo "🥷  $@" 1>&2
	"$@"
}

repo_to_dir() {
	echo repo/$(basename $1)
}

for_each_repo() {
	for repo in ${repositories[@]}; do
		$1 $repo
	done
}