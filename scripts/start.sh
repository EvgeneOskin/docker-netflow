set -eu

mkdir -p /flows

nfcapd -D -t 60 -l /flows
softflowd -d -i any -v 9 -n 127.0.0.1:9995
