#! /bin/bash

# [[ -z $backup_suffix ]] && backup_suffix=before_frno_dotfiles

declare -a directories
directories=($@)

if [ -z $directories ] ; then
	for f in * ; do
		if [ -d $f ] ; then
			directories+=($f)
		fi
	done
fi
for dir in "${directories[@]}"; do
	if [ -d $dir ] ; then
		pushd . > /dev/null
		cd $dir
		if [ -r dotfiles ]; then
			echo "Creating symlinks for $dir"
			while read df; do
				if [ -w ~/$df ]; then
					# mv -f ~/$df ~/$df.$backup_suffix
					rm ~/$df
				fi
				ln -s $(pwd)/$df ~/$df
				echo "created symlink for $df"
			done < dotfiles
		fi
		popd > /dev/null
	fi
done
