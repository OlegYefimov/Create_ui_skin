for dir in */; do
    echo "$dir"
	len=$( echo "$dir" | tr -d -c '_' | awk '{ print length; }' )
	
	s_end=$(expr $len + 1)
	
	name=$(echo "$dir" | awk -v slen="$len" -v s_end="$s_end" -F'(_)' '{print $slen,$s_end}' | sed 's:/*$::')
	echo $name
	
	number=$(echo "$dir" | awk -v slen="$s_end" -F'(_)' '{print $slen}' | sed 's:/*$::')
	echo $number
	
	uiFILE=$dir"ui_skin.json"
	echo "{" | tee $uiFILE
	echo "\"skinname\": \""$name"\"," | tee -a $uiFILE
	echo "\"drivername\": \"\"," | tee -a $uiFILE
	echo "\"country\": \"\"," | tee -a $uiFILE
	echo "\"team\": \"\"," | tee -a $uiFILE
	echo "\"number\": \""$number"\"," | tee -a $uiFILE
	echo "\"priority\": \"1\"," | tee -a $uiFILE
	echo "}" | tee -a $uiFILE
done