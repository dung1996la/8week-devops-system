# 8-Week DevOps/System Engineer Practice - dung1996la
Progress: 1/56 days (cập nhật hàng ngày)

## Week 1 – Linux Troubleshooting Sâu
| Day | Task | Status | Notes / Link |
|-----|------|--------|--------------|
| 1   | Cài 1 VM Debian → tạo + fix OOM killer (1 cases) | [X] | week1-linux-troubleshooting/ screenshots & scripts |
| 2   | High CPU load: stress-ng, top, nice, cpulimit (5 cases) | [ ] |  |
| 3   | Disk full + inode exhaust + no space left (5 cases) | [ ] |  |
| 4   | Fork bomb, ulimit, high iowait, systemd limits (5 cases) | [ ] |  |
| 5   | Kernel panic & recovery (sysctl, module blacklist) 3 cases | [ ] |  |
| 6   | Viết 5 script detect sớm (OOM, disk>90%, inode>90%, load>10, swap>50%) | [ ] | week1/scripts/ |
| 7   | Tổng hợp 20 cases + README tuần 1 | [ ] | week1/README.md |

## Week 2 – Docker Thực Chiến
| Day | Task | Status | Notes |
|-----|------|--------|-------|
| 8   | Multi-stage Dockerfile Node.js < 50MB | [ ] | week2/dockerfiles/node/ |
| 9   | Multi-stage Java/Spring Boot < 100MB | [ ] |  |
| 10  | docker-compose 6 services (nginx + app + redis + postgres + prometheus + grafana) | [ ] | week2/docker-compose.yml |
| 11  | Tạo + fix 5 lỗi: OOM, network isolate, volume permission, port conflict, dangling images | [ ] | screenshots/week2/ |
| 12–14 | Dockerfile best practices + .dockerignore + cleanup script | [ ] |  |

## Week 3 – Kubernetes Cơ Bản (kind hoặc k3s)
| Day 15–21 | 30 lab KodeKloud + deploy nginx + mysql có PVC + fix CrashLoopBackOff, ImagePullBackOff, OOMKilled | [ ] | week3/manifests/ |

## Week 4 – Kubernetes Nâng Cao
| Day 22–28 | Ingress-nginx + domain local + Helm install 5 chart + tự viết 1 Helm chart | [ ] | week4/helm-charts/ |

## Week 5 – Nginx Nâng Cao
| Day 29–35 | 10 vhost + LetsEncrypt + rate limit + cache + lua block bad bot/IP VN | [ ] | week5/nginx.conf |

## Week 6 – Monitoring
| Day 36–42 | Prometheus + Node/cAdvisor + Grafana 5 dashboard đẹp + Alertmanager → Telegram 10 rule | [ ] | week6/grafana/dashboards/ |

## Week 7 – Elasticsearch (optional nếu job có)
| Day 43–49 | Docker-ELK 3 node cluster green + snapshot/restore minIO | [ ] |  |

## Week 8 – CI/CD + Final Project
| Day 50–56 | GitLab CI pipeline + deploy WordPress full bằng Helm lên k3s + monitoring + alert | [ ] | week8/final-project/ |
