# Wi-Fi Auto Login for OpenWrt

This is a minimal **sh** script that automatically logs in to captive Wi-Fi portal (e.g., 10.0.0.1) from OpenWrt routers.

### Example Captive Portal Login Page

![Login Page Screenshot](example_of_login_page.png)

Useful for apartments, hotels, or ISPs that require web-based login every day.

## 🔧 Features

- Detects internet connectivity (DNS and ping)
- Authenticates via HTTP POST
- Runs automatically via cron
- Quiet and fully self-contained

## 🛠 Requirements

- OpenWrt (tested on BusyBox 1.35+)
- `wget`, `ping`, and `nslookup` installed (default in most OpenWrt builds)

## 🚀 Usage

1. Copy `wifi_login.sh` to `/etc/wifi_login.sh`:
```sh
chmod +x /etc/wifi_login.sh
```
2. Enable cron (use your timezone, e.g for me 20:02 in UTC = 03:02 in UTC+7)
```sh
crontab -e

2 20 * * * /etc/wifi_login.sh > /tmp/wifi_login.log 2>&1

/etc/init.d/cron start

/etc/init.d/cron enable
```

## 🧠 How It Works
- Sends login credentials to http://10.0.0.1/portal/user-authen.php

- Verifies external internet access by:

    - Resolving DNS for google.com via 1.1.1.1

    - Pinging 1.1.1.1

- Repeats login if check fails

## 📄 Example log output:
```sh
Sun Jul 13 09:58:41 UTC 2025 Attempting login
Sun Jul 13 09:58:42 UTC 2025 Attemping check external internet
Sun Jul 13 09:58:42 UTC 2025 Checking DNS resolution (google.com via 1.1.1.1)
Sun Jul 13 09:58:42 UTC 2025 DNS resolution: OK
Sun Jul 13 09:58:42 UTC 2025 Checking ping to 1.1.1.1
Sun Jul 13 09:58:42 UTC 2025 Ping: OK
Sun Jul 13 09:58:42 UTC 2025 Online — exiting
```
## 🔒 Notes

Change txtLogin and txtPasswd in the script to match your real credentials.
