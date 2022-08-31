sudo python3.8 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install --upgrade setuptools
sudo /opt/certbot/bin/pip install certbot
sudo /opt/certbot/bin/pip install mock wheel==0.22.0

# Dont have certbot installed
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
sudo /opt/certbot/bin/python3 -m ensurepip --upgrade
sudo /opt/certbot/bin/pip install -i https://test.pypi.org/simple/ certbot-dns-metaname==0.2.4

# dev
sudo /opt/certbot/bin/pip install /mnt/c/Users/Taylor/code/certbot_dns_metaname/dist/certbot_dns_metaname-0.2.4-py2.py3-none-any.whl --force-reinstall