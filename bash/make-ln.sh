source ../constants.sh
for f in '.bashrc' '.bash_profile' '.bash_aliases' '.bash_logout' 
do
	if [ -w ~/$f ] 
	then
		mv ~/$f ~/$f.$backup_suffix
	fi	 
	ln -s $(pwd)/$f ~/$f
done

