#!/bin/bash
export LANG=en_US.UTF-8

function my_func {
if [ $# -ne 0 ]
then
	cd $1
fi
local array=($(ls))
for i in ${array[@]}
do
	file=$(( file + 1 ))
	for j in ${probel[@]}
	do
		if [ $j -eq 2 ] # The first case is empty.
		then
			printf "\u0020\u0020\u0020\u0020"
		else
		
			printf "\u2502\u00A0\u00A0\u0020"

			#printf "\u00A0\u00A0\u0020 "
			
		fi
	done
	if [ $i == ${array[-1]} ]
	then
		printf "\u2514\u2500\u2500\u0020"
	else
		printf "\u251c\u2500\u2500\u0020"
	fi
	echo "$i"
	if [[ -d $i ]]
	then
		dir=$(( dir + 1 ))
		if [[ -d $i ]] && [ $i != ${array[-1]} ]
		then
			probel+=( 1 )
		else
			probel+=( 2 )
		fi
		my_func $i # Until the file has not the end.
		unset probel[-1]
	fi
done
cd ..
}
if [ $# -eq 0 ]
then
	echo "."
else
	echo $1
fi
file=0
dir=0
probel=()
my_func $1
echo
if [ $dir -eq 1 ] && [ $(( file - dir )) -ne 1 ]
then
echo "1 directory, $(( file - 1 )) files"
elif [ $dir -ne 1 ] && [ $(( file - dir )) -eq 1 ]
then
echo "$dir directories, 1 file"
elif [ $dir -eq 1 ] && [ $(( file - 1 )) -eq 1 ]
then
echo "1 directory, 1 file"
else
echo "$dir directories, $(( file - dir )) files"
fi
