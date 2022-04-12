user=($(who))

echo "Hello "$user
exitcode=1
while [ $exitcode -ne 0 ]
do
	echo "Enter birthday month (##): "
	read month

	echo "Enter birthday day (##): "
	read birthday
	
	echo "Enter year of birth (##)"
	read birthyear

	year=($(date +%Y))

	if [ -z $1 ]; then

		currmonth=($(date +%m))

		currday=($(date +%d))
		
		currdate=($(date +%s))
		
	else
		
		currepoch=($(date +%s))
		addepoch=$(($1*24*60*60))
		if [ $addepoch -gt 473040000 ] || [ $addepoch -lt 0 ];then
			currmonth=($(date +%m))
			currday=($(date +%d))
			currdate=($(date +%s))
		else
			newepoch=$(($currepoch+$addepoch))
			currmonth=($(date -d @$newepoch +%m))
			currday=($(date -d @$newepoch +%d))
			currdate=($(date -d @$newepoch +%s))
			year=($(date -d @$newepoch +%Y))
			
		fi

	fi	
		

	if [ $currday == 31 ] && [ $currmonth == 10 ]; then
		echo "It's Halloween!!!"
	fi

	if [ $currday == 25 ] && [ $currmonth == 12 ]; then
		echo "It's Christmas!!!"
	fi

	if [ $currday == 17 ] && [ $currmonth == 03 ]; then
		echo "It's St.Patricks!!!"
	fi

	if [ $currday == 01 ] && [ $currmonth == 07 ]; then
		echo "It's Canada Day!!!"
	fi



	if [ $birthday == 31 ] && [ $month == 10 ]; then
		echo "Your birthday is Halloween!!!"
	fi

	if [ $birthday  == 25 ] && [ $month == 12 ]; then
		echo "Your birthday is Christmas!!!"
	fi

	if [ $birthday  == 17 ] && [ $month == 03 ]; then
		echo "Your birthday is St.Patricks!!!"
	fi

	if [ $birthday  == 01 ] && [ $month == 07 ]; then
		echo "Your birthday is Canada Day!!!"
	fi


	if [ $month -lt $currmonth ]; then
		((year=year+1))
	fi

	if [ $month == $currmonth ]; then
		if [ $birthday -lt $currday ]; then
			((year=year+1))
		fi
	fi
		


	bday=($(date -d "$month/$birthday/$year" +%s))

	if [ $currday == $birthday ] && [ $currmonth == $month ]; then
		age=$(($year - $birthyear))
		echo "Today is your birhtday and you are now "$age" years old!"
	else
		echo $(( (bday - currdate) / 86400 )) days till your birthday.
	fi
	echo "Enter 0 to quit or enter any other key and press enter."
	read exitcode
done
