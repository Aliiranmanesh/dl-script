#!/bin/bash
read -p "Enter link:" link
read -p "Enter hour:" hour
read -p "Enter minute:" minute
date_hour=`date +%H`
date_minute=`date +%M`
sigma_date=$((date_hour * 60 + date_minute))
sigma_date_input=$((hour * 60 + minute))
while [ "$sigma_date" != "$sigma_date_input" ]; do
	sleep 20
        date_minute=`date +%M`
        sigma_date=$((date_hour * 60 + date_minute))
done
wget "$link"
if [ "$?" == "0" ]; then
	notify-send "Download complete"
else
	notify-send "Error"
fi

