#!/bin/bash

key="ACS_KEY_HERE"

curl -b cookies.txt -c cookies.txt -F "login=ACSUSERNAME_HERE" -F "password=ACSPASSWORD_HERE" "https://api.cloud.appcelerator.com/v1/users/login.json?key=$key"


INPUT=acs_places.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo “$INPUT file not found”; exit 99; }
while read name latitude longitude tags
do
	echo "Name : $name"
	echo "Latitude : $latitude"
	echo "Longitude : $longitude"
	echo "Tags : $tags"


curl -b cookies.txt -c cookies.txt -F "name=$name" -F "latitude=$latitude" -F "longitude=$longitude" -F "tags=$tags" -F "su_id=SUID_HERE" https://api.cloud.appcelerator.com/v1/places/create.json?key=$key&pretty_json=true


done < $INPUT
IFS=$OLDIFS
