#!/bin/bash
set -euo pipefail

PFX=":vendoff:"

command=${1:-}

echo "$PFX command=[$command]"
case "$command" in
	on)
		if [[ -d _novendor ]]; then
			if [[ -d vendor ]]; then
				echo "$PFX cannot move _novendor folder - something's in the way"
			else
				echo "$PFX move vendor to _novendor"
				mv _novendor vendor
			fi
		fi
		if [[ -d vendor ]]; then
			echo "$PFX remove skip-worktree option"
			pushd vendor
			git update-index --no-skip-worktree $(git ls-files | tr '\n' ' ')
			popd
		fi
		;;
	off)
		if [[ -d vendor ]]; then
			echo "$PFX set skip-worktree option on vendor folder"
			pushd vendor
			git update-index --skip-worktree $(git ls-files | tr '\n' ' ')
			popd
			if [[ -d _novendor ]]; then
				echo "$PFX cannot move vendor folder - something's in the way"
			else
				echo "$PFX move vendor to _novendor"
				mv vendor _novendor
			fi
		else
			echo "$PFX no vendor folder"
		fi
		;;
	init)
		echo "$PFX append _novendor to .gitignore"
		echo "_novendor" >> .gitignore
		;;
	*)
		echo "$PFX usage: $0 on|off|init"
		exit 1
esac
