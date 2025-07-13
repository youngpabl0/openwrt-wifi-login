Just copy wifi_login.sh to your OpenWRT router and add it in cron like that:

```sh
root@OpenWrt:~# crontab -l root

2 20 * * * /etc/wifi_login.sh > /tmp/wifi_login.log 2>&1
```

It will preserve 1 last log in tmp catalog and invoke it at 03:01 UTC (55sec sleep before start just right to first run at 03:01:55)




Example log:
```sh
Sun Jul 13 09:58:41 UTC 2025 Attempting login
Sun Jul 13 09:58:42 UTC 2025 Attemping check external internet
Sun Jul 13 09:58:42 UTC 2025 Checking DNS resolution (google.com via 1.1.1.1)
Sun Jul 13 09:58:42 UTC 2025 DNS resolution: OK
Sun Jul 13 09:58:42 UTC 2025 Checking ping to 1.1.1.1
Sun Jul 13 09:58:42 UTC 2025 Ping: OK
Sun Jul 13 09:58:42 UTC 2025 Online — exiting
```