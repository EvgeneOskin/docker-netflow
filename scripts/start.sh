set -eu

mkdir -p /flows

sh /nifi/bin/nifi.sh start
sleep 5
tail -f /nifi/logs/nifi-app.log
