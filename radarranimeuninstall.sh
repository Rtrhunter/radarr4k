#!/bin/bash

# Script by @ComputerByte
# For Radarr 4K Uninstalls

# Log to Swizzin.log
export log=/root/logs/swizzin.log
touch $log

systemctl disable --now -q radarranime
rm /etc/systemd/system/radarranime.service
systemctl daemon-reload -q

if [[ -f /install/.nginx.lock ]]; then
    rm /etc/nginx/apps/radarranime.conf
    systemctl reload nginx
fi

rm /install/.radarranime.lock

sed -e "s/class radarranime_meta://g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    name = \"radarranime\"//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    pretty_name = \"Radarr Anime\"//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    baseurl = \"\/radarranime\"//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    systemd = \"radarranime\"//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    check_theD = True//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/    img = \"radarr\"//g" -i /opt/swizzin/core/custom/profiles.py
sed -e "s/class radarr_meta(radarr_meta)://g" -i /opt/swizzin/core/custom/profiles.py
