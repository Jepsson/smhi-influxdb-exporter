#!/bin/bash

if [ -z "$LONGITUDE" ]; then
	echo "Please set environment variable LONGITUDE"
	exit 1
fi

if [ -z "$LATITUDE" ]; then
	echo "Please set environment variable LATITUDE"
	exit 1
fi

if [ -z "$INFLUX_USER" ]; then
	echo "Please set environment variable INFLUX_USER"
	exit 1
fi

if [ -z "$INFLUX_PASS" ]; then
	echo "Please set environment variable INFLUX_PASS"
	exit 1
fi

if [ -z "$HOSTNAME" ]; then
	echo "Please set environment variable HOSTNAME"
	exit 1
fi

if [ -z "$PORT" ]; then
	echo "Please set environment variable PORT"
	exit 1
fi

if [ -z "$DATABASE" ]; then
	echo "Please set environment variable DATABASE"
	exit 1
fi

if [ -z "$RETENTION_POLICY" ]; then
	echo "No RETENTION_POLICY set, assuming 'default'"
	RETENTION_POLICY="default"
fi

declare -r api_url="https://opendata-download-metfcst.smhi.se/api/category/pmp3g/version/2/geotype/point/lon/${LONGITUDE}/lat/${LATITUDE}/data.json"

while true; do
	declare -r temp=$(
		curl --silent $api_url | \
		jq '.timeSeries | .[0] | .parameters[] | select(.name == "t") | .values[0]')

	curl --request POST --silent --user $INFLUX_USER:$INFLUX_PASS "http://$HOSTNAME:$PORT/write?db=$DATABASE&precision=h&rp=$RETENTION_POLICY" --data-binary "smhi_temp value=$temp"
	sleep 1h
done
