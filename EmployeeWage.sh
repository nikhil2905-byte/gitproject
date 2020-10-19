#!/bin/bash -x
# CONSTANTS
isPartTime=1;
isFullTime=2;
maxHrsInMonth=10;
empRatePerHr=20;
numWorkingDays=2;
#VARIABLES
totalEmpHrs=0;
totalWorkingDays=0;
function getWorkingHours() {
	case $1 in
		$IS_FULL_TIME)
		workHours=8
		;;
		$IS_PART_TIME)
		workHours=4
		;;
		*)
		workHours=0
		;;
	esac
	echo $workHours
}
function calcDailyWage() {
	local workHours=$1
	wages=$(( $workHrs*$empRatePerHr ))
	echo $wage
}
while [[ $totalEmpHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
	(( totalWorkingDays++ ))
	workHours="$( getWorkingHours $(( $RANDOM%3 )) )"
	totalWorkHours=$(($totalEmpHours + $workHours))
	empDailyWage[ "$totalWorkingDays" ]="$( calcDailyWage $totalEmpHours )"
done
totalSalary="$(( $totalWorkHours*$calcDailyWage ))"
echo "daily wage "${empDailyWage[@]}"
echo "All keys " ${!empDailyWage[@]}
