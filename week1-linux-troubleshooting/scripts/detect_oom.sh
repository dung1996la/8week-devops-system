#!/bin/bash
if sudo dmesg | grep -qi "kill process.*(stress)" || sudo journalctl -k --since "5 min ago" | grep -qi "oom"; then
    echo "CRITICAL: OOM Killer vừa hoạt động!"
    sudo dmesg | grep -i "kill process" | tail -3
    exit 2
fi
echo "OK: Không có OOM gần đây"
exit 0
