#!/bin/bash
# Use for Zabbix/Nagios/Prometheus node_exporter
CORES=$(nproc)
LOAD1=$(uptime | awk -F'load average:' '{print $2}' | awk -F, '{print $1}' | tr -d ' ')

THRESHOLD=$(echo "$CORES * 2.0" | bc)

if [ $(echo "$LOAD1 > $THRESHOLD" | bc -l) -eq 1 ]; then
    echo "CRITICAL – Load average $LOAD1 > ${THRESHOLD} (cores=$CORES)"
    echo "Top 5 CPU hogs:"
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6
    exit 2
else
    echo "OK – Load average $LOAD1 (threshold $THRESHOLD)"
    exit 0
fi
