#help algorhythm
if [ "$1" = "--help" ]
then
	echo 'Usage: 
		./%script_file_name% DICE_AMOUNT "DICE SIDES"
		./%script_file_name% DICE_AMOUNT
		./%script_file_name%'
	exit 0
fi

#getting dice amount

if [ -z "$1" ]
then
	echo "Type amount of dice (number)"
	read amount
else
	amount=$1
fi


#getting amount of dice sides of each die

amounts=""

if [ -z "$1" ]
then
	echo "Type your maximum dice values (one line)"
	read amounts
	amounts="$amounts "
	echo
else
	if [ -z "$2" ]
	then
		echo "Type your maximum dice values (one line)"
		read amounts
		amounts="$amounts "
		echo
	else
		amounts="$2 "
	fi
fi


#generating random values, summing them
sum=0
for i in  `seq 1 $amount`
do
	space=`expr index "$amounts" " "`
	maxvalue=${amounts:0:$space}
	echo "Max dice value: $maxvalue"
	amounts=${amounts:$space}
	value=$((1 + $RANDOM % $maxvalue))
	echo "Value: $value
	"
	sum=$(($sum + $value))
done
echo "__________________________________________"
echo "Sum: $sum"

#disabling variables
amount=
amounts=
sum=
space=
maxvalue=
value=
sum=
