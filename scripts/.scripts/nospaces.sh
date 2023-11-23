#!/bin/sh

CHAR="_"

set -e

USAGE="$0: replace spaces in filenames

USAGE: $0 [-r|--recurse] [-d directory] [files]

By default, apply on every file in the current directory.
If -d is specified, apply to every file of the given directory.
If filenames are specified, apply on the given files."

# set -x

recursive=false
dryrun=false
directory=""

OPTS=rd:nh?
LONGOPTS=recurse,directory:,dry-run,help
PARSED=$(getopt --options=$OPTS --longoptions=$LONGOPTS --name "$0" -- "$@")
eval set -- "$PARSED"

while true; do
	case $1 in
		-r|--recursive)
			recursive=true
			;;
		-n|--dry-run)
			dryrun=true
			;;
		-d|--directory)
			shift
			directory="$1"
			;;
		-\?|-h|--help)
			echo "$USAGE"
			exit 0
			;;
		--)
			shift
			break
			;;
	esac
	shift
done
if [ -n "$directory" ] && [ -n "$1" ]; then
	echo "Either specify -d or files, not both"
	exit 1
fi

rename() {
  file="$1"
	if [[ "$file" == *" "* ]]; then
			new_name=$(echo "$file" | sed -e "s/ - /-/g" -e "s/ /${CHAR}/g")
			while [ -e "$new_name" ]; do
			new_name="${new_name}_"
			done

			[ "$dryrun" = false ] && mv "$file" "$new_name"
			echo "$file -> $new_name"
	fi

	if [ "$recursive" = true ] && [ -d "$file" ]; then
			rename_files "$file"
	fi
}

rename_files() {
	for file in "$@"/*; do
		rename "$file"
	done
}

[ "$dryrun" = true ] && echo DRY RUN MODE
directory="${directory:-.}"
if [ -z "$1" ]; then
	rename_files "$directory"
else
	while [ -n "$1" ]; do
		rename "$1"
		shift
	done
fi
