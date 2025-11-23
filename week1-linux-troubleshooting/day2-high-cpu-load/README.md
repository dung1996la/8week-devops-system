# Day 2 – High CPU / High Load Average

**Root cause logic**: Load average = số process runnable + uninterruptible (I/O wait). CPU 100% = tất cả core busy (us/sy). I/O wait (wa) cao = process chờ disk, load tăng nhưng CPU thấp. Nguyên nhân: runaway loops, mining, GC storm, legacy code.

**Cases triggered** (VM 4GB RAM):
- All cores 100%: stress-ng --cpu $(nproc) --cpu-load 100 (load > cores*2).
- Runaway openssl: 12 process openssl speed & (800–1200% CPU).
- Mining fake: 30 sha256sum loop & (2000–3000% CPU).
- Perl infinite: 40 perl -e 'while(1){}' & (3500–4000% CPU).
- Single rogue: 1 stress-ng --cpu 1 (100% 1 core).
- I/O wait high load: dd if=/dev/zero of=/tmp/file bs=1M count=10240 oflag=direct (load 30–50, wa 70–90%, CPU <30%).

**Fixes**:
- Quick: nice -n -10 <pid>, renice -15 -p <pid>, cpulimit -p <pid> -l 50.
- Production: cgroup v2 (CPUQuota=50% in systemd slice); systemd-run -p CPUQuota=20% <command>.

**Detection**: Script check load1 > cores*2 (uptime + bc), ps top 5 CPU hogs (exit 2).

Screenshots: htop wa đỏ, detect CRITICAL with top 5.
