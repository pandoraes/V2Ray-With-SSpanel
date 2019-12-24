#!/usr/bin/env /bin/sh

if [ ! -z "${testid}" ]
    then
         sed -i "s/123456/${testid}/g" "/etc/Caddyfile"
fi
if [ ! -z "${caddymail}" ]
    then
         sed -i "s/xxx@xxx.com/${caddymail}/g" "/etc/Caddyfile"
fi
if [ ! -z "${caddycdn}" ]
    then
         sed -i "s/cdn.xxx.com/${caddycdn}/g" "/etc/Caddyfile"
fi
if [ ! -z "${path}" ]
    then
         sed -i "s/news/${path}/g" "/etc/Caddyfile"
fi

if [ ! -z "${disbaleproxy}" ]
    then
         sed -i "s/#proxy/${disbaleproxy}/g" "/etc/Caddyfile"
fi


if [ ! -z "${proxyurl}" ]
    then
         sed -i "s|\"https://www.china.com\"|\"${proxyurl}\"|g" "/etc/Caddyfile"
fi


if [ ! -z "${id}" ]
    then
         sed -i "s/xxxxxxxx/${id}/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${alterId}" ]
    then
         sed -i "s/119/${alterId}/g" "/etc/v2ray/config.json"
fi

if [ ! -z "${sspanel_url}" ]
    then
         sed -i "s|\"https://google.com\"|\"${sspanel_url}\"|g" "/etc/v2ray/config.json"
fi
if [ ! -z "${key}" ]
    then
         sed -i "s/\"NimaQu\"/\"${key}\"/g" "/etc/v2ray/config.json"
fi

if [ ! -z "${node_id}" ]
    then
         sed -i "s/123456/${node_id}/g" "/etc/v2ray/config.json"
fi

cat /etc/Caddyfile
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json &
/bin/parent caddy --conf /etc/Caddyfile --log stdout --agree=true
/bin/sh

