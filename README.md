# README

## Setup

### Prepare certbot

Install certbot via pip, and install the certbot plugin and setup your credentials file.

```shell
sudo python3.8 -m venv /opt/certbot
sudo /opt/certbot/bin/pip install certbot-dns-metaname==0.2.5 # Version might change
sudo vim /path/to/creds # Enter your creds here
```

### Create credentials

Put a file like this somewhere with your details for metaname

```ini
certbot_dns_metaname:dns_metaname_endpoint=http://metaname.api/metaname
certbot_dns_metaname:dns_metaname_username=domain.com
certbot_dns_metaname:dns_metaname_api_key=0923809128asjdklja0912
```

### Executing certbot

Invoke certbot like so to get a cert.

```shell
/opt/certbot/bin/certbot certonly \
    -d $(hostnamectl --static).yourdomain.com \
    --authenticator certbot-dns-metaname:dns-metaname \
    --certbot-dns-metaname:dns-metaname-credentials /opt/certbot/metaname_creds \
    --certbot-dns-metaname:dns-metaname-propagation-seconds 30 \
    -n  \
    --agree-tos \
    --email your.email@here.com
```

### Systemd service

You can also make a systemd service like this to run it on every boot (useful in a container/template so all new machines get a cert)

```service
[Unit]
Description=Runs certbot with the metaname-dns plugin to get a certifiate for this machine
After=register_dns.service

[Service]
Type=oneshot
WorkingDirectory=/opt/certbot
ExecStart=/path/to/start.sh

[Install]
WantedBy=multi-user.target
```
