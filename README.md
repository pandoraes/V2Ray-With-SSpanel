## For NODE

```
bash <(curl -L -s  https://raw.githubusercontent.com/pandoraes/V2Ray-With-SSpanel/master/install-release.sh) --panelurl https://xxxx --panelkey xxxx --nodeid NODEID

# restart v2ray node services

systemctl start v2ray

# recheck v2ray status

systemctl status v2ray

# enable auto start

systemctl enable v2ray
```
### For MySQL Connect

reset this config to right setting

```
      "mysql": {
        "host": "5x.xxx.xxx.x1",
        "port": 3306,
        "user": "wwwxxxhk",
        "password": "nbdiD.xxxxT3Mj",
        "dbname": "wwwxxxhk"
      },
```

**NOTE**

```
panelurl : Your SSpanel URL
panelkey : Your SSpanel `mukey`, you can find it in `/path/to/wwwroot/config/.config.php`
nodeid : Your Node ID, you can set this in your SSpanel
```

**DO NOT**  forget to config your sspanel like this.

> `YourNodeAddress;PortNum;AlterId;Method;Misc(like:Confuse、path and so more)`
>
> e.g:
>
> `test.node.1.domain;443;3;ws;tls;path=/`
>
> - YourNodeAddress:`test.node.1.domain`
> - PortNum:`443`
> - AlterId:`3`
> - Misc:
>   - path:`/`
>   - Confuse:`tls`


# For Aliyun User
Uninstall YunDun
```
[Windows]

http://update.aegis.aliyun.com/download/uninstall.bat?spm=a2c4g.11186623.2.5.h6JSZc&file=uninstall.bat 


[linux]

wget http://update.aegis.aliyun.com/download/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
chmod +x quartz_uninstall.sh
./quartz_uninstall.sh
pkill aliyun-service
rm  -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
rm  -rf /usr/local/aegis*
rm -rf /usr/sbin/aliyun*
chkconfig --del cloudmonitor
```



# For websocket
```
[nginx]
    location /ws { # It is consistent with the path in v2ray configuration
      if ($http_upgrade != "websocket") { # 404 when websocket negotiation fails
          return 404;
      }
      proxy_redirect off;
      proxy_pass http://127.0.0.1:7888; # Suppose websocket is listening on port 10000 of the loopback address
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Host $host;
      # Show real IP in v2ray access.log
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
 ```


# Netspeed script all in one
```
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x tcp.sh
./tcp.sh
```

# v2ray config for websocket
```
  "inbounds": [{
    "listen": "127.0.0.1",
    "port": 7889,//need nginx to stagger the port, otherwise it will conflict
    "protocol": "dokodemo-door",
    "settings": {
      "address": "127.0.0.1"
    },
      "streamSettings": {
        "networks":"ws",
        "wsSettings": {
        "path": "/ws"
        }
      },
    "tag": "api"
  }]
```

# sspanel-uim config For websocket
```
youdomain;0;16;tls;ws;path=/ws|host=youdomain|server=youdomain|inside_port=7888|outside_port=443
```