msg() 
{
	echo =======================================================
	echo "$i) Next step (Exec? [RET/R/s/b|r/q])"
	echo
	echo ">>> $1"
	echo
	shift
	echo -n "\$ $* "
	#echo
	#echo -n "Exec? [ret/r/q]: "
	read ans
	
	[ "$ans" = "R" ] && return 1  # RESET
	[ "$ans" = "q" ] && return 2  # Quit
	[ "$ans" = "b" ] && return 3  # Back one command
	[ "$ans" = "r" ] && return 3  # Back one command
	[ "$ans" = "s" ] && return 4  # Skip command

	[ "$ans" = "" ] && eval "$*" 

	#sleep 2
	##echo
	##while true
	##do
		##echo -n "Hit Return or q: "
		##read ans
		##[ "$ans" = "q" ] && return 2  # Quit
		##[ "$ans" = "" ] && return 0
	##done
	return 0
}
