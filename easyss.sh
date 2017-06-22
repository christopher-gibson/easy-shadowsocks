#!/bin/sh

OPTS=`getopt --long help,port:,password:,method -n 'parse-options' -- "$@"`

PORT=
PASSWORD=
METHOD="chacha20-ietf"

usage() {
cat << EOF
Usage: ${0} [--port PORT] [--password PASSWORD] [--method METHOD]

Builds the docker image with the Dockerfile located in the current directory.

    --port              Required. Sets the exposed port and container name.
    --password          Required. Sets the password.
    --method            (Default: $METHOD) Sets the method.
    --help              Display this help and exit.
EOF
}

while true; do
  case "$1" in
    --help ) usage; exit 0;;
    --port ) PORT="$2"; shift; shift ;;
    --password ) PASSWORD="$2"; shift; shift;;
    --method ) METHOD="$2"; shift; shift;;
    -- ) shift; break;;
    * ) break;;
  esac
done

if [ ! "$PORT" ] || [ ! "$PASSWORD" ] || [ ! "$METHOD" ]
then
    usage
    exit 1
fi

docker run -d -p $PORT:8388 -p $PORT:8388/udp --name shadowsocks-$PORT --rm \
  -e "METHOD=$METHOD" \
  -e "PASSWORD=$PASSWORD" \
  easypi/shadowsocks-libev
