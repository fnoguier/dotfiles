#! /bin/bash

[[ -z $backup_suffix ]] && backup_suffix=before_frno_dotfiles

declare -a directories
directories=($@)

if [ -z "$directories" ] ; then
	for f in * ; do
		if [ -d "$f" ] ; then
			directories+=($f)
		fi
	done
fi
for dir in "${directories[@]}"; do
	if [ -d "$dir" ] ; then
		pushd . > /dev/null
		cd "$dir" || exit 1
		if [ -r dotfiles ]; then
			echo "Creating symlinks for $dir"
			while read -r df; do
				if [ ! -h "$HOME/$df" ]; then
					mv -f "$HOME/$df" "$HOME/$df.$backup_suffix"
					echo "backed up existing $df as $df.$backup_suffix"
				fi
				if [ -f "$HOME/$df" ]; then
					rm "$HOME/$df"
				fi
				ln -s "$(pwd)/$df"  "$HOME/$df"
				echo "created symlink for $df"
			done < dotfiles
		fi
		popd > /dev/null
	fi
done
