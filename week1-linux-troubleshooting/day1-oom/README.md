# Day 1 – OOM Killer Troubleshooting

**Root cause logic**: Kernel OOM killer run when RAM + swap < overcommit limit (default vm.overcommit_memory=0, allow overcommit to 50% RAM). oom_score depend on RSS/VM of process, kill highest process to fix system problems (SIGKILL signal 9).

**Cases triggered** (VM 1GB RAM, no swap):
- Stress --vm 4 --vm-bytes 1G: 2 invocations oom-killer (dmesg: "stress invoked oom-killer").
- Python leak (list append 100MB loop): 1 invocation (dmesg: "python3 invoked oom-killer").
- Fork bomb (:(){ :|:& };: with ulimit -u unlimited): Skipped full OOM do PID limit, but caused 50+ "Killed process (bash)" (VM too small – re-test on 4GB Day 2).

**Fixes**:
- Swap: fallocate 4G /swapfile, mkswap, swapon, add to fstab (tăng overcommit capacity).
- Tuning: vm.overcommit_memory=2 (strict, force OOM early); sysctl vm.swappiness=10 (swap ít hơn).

**Detection**: Script grep journalctl --since "15 min ago" for "oom|kill process" (exit 2 for alert tools).

Screenshots: dmesg proof, free before/after, script run CRITICAL.
