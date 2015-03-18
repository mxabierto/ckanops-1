#!/bin/bash
API_TOKEN_FILE="./API_TOKEN"
CK_HOST="http://catalogo.datos.gob.mx"
NOW=$(date "+%d/%m/%Y - %H:%M:%S")
API_TOKEN="${CKAN_API_TOKEN:-null}"
PURGE=false

if [ $# -eq 0 ]; then
	echo "Usage: $0 [-p] INSTITUTION_ID"
	exit 2
fi

while getopts :p opt; do
	case $opt in
		p)
			PURGE=true
		;;
		\?)
			echo "Invalid argument: $OPTARG"
			exit 2
		;;
	esac
done
shift $((OPTIND-1))

if [ "$API_TOKEN" == "null" ]; then
	if [ -f "$API_TOKEN_FILE" ]; then
		API_TOKEN=$(cat "$API_TOKEN_FILE")
	else
		echo "FATAL: Token file not found!"
	fi
fi

if [ "$API_TOKEN" != "null" ]; then
	export CKAN_HOST="$CK_HOST"
	export CKAN_API_TOKEN="$API_TOKEN"
	echo "$NOW ::: synchronizing $1 datasets with http://adela.datos.gob.mx/$1/catalogo.json ..."
        echo "$NOW ::: synchronizing $1 datasets with http://adela.datos.gob.mx/$1/catalogo.json" >> harvest.log
	#echo $CKAN_API_TOKEN
        #echo $CKAN_HOST
	if [ "$PURGE" = true ]; then
		#echo "purge"
		python ckanops.py --purge-harvest "http://adela.datos.gob.mx/$1/catalogo.json"
	else
		#echo "normal"
		python ckanops.py --harvest "http://adela.datos.gob.mx/$1/catalogo.json"	
	fi
else
	echo "FATAL: No API token defined"
fi
