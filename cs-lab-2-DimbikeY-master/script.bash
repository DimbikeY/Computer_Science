#!/bin/bash
x=$1
y=$2
sum=$(( x+y ))
diff=$(( x-y ))
multi=$(( x*y ))
echo -n "$sum $diff $multi "	
if [[ y -eq 0 ]];then 
	echo "#"
elif [[ x -eq 0 ]];then 
	echo "0.00"
elif [[ $multi -lt 0 && x**2 -lt y**2 ]];then   
	echo -n "-0." 
	if [[ $(( (x*10)**2 )) -lt y**2 ]];then
		echo -n "0"
	fi
	tricky_divide="$(( -( $x * 100 / $y ) % 100 ))" 
	echo $tricky_divide  
elif [[ x**2 -lt y**2  && $multi -gt 0 ]];then 		    
	echo -n "0." 
	if [[ $(( (x*10)**2 )) -lt y**2 ]];then
		echo -n "0"
	fi
	tricky_divide="$(( ( $x * 100 / $y ) % 100 ))"
	echo $tricky_divide
else 
	if [[ x**2 -gt y**2 && $multi -lt 0 ]];then
		remainder="$(( -( $x * 100 / $y ) % 100 ))"
		tricky_divide="$(( ( $x / $y ) )).$(( -( $x * 100 / $y ) % 100 ))"
	else	# 15 3 or -15 -3. It doesn't matter
		remainder="$(( ( $x * 100 / $y ) % 100 ))"
		tricky_divide="$(( ( $x / $y ) )).$(( ( $x * 100 / $y ) % 100 ))"
	fi
	while [ ${#remainder} -lt 2 ]
	do
		remainder+='1'
		tricky_divide+='0'
	done
	echo $tricky_divide
fi

