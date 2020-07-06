# V2Ray With SSpanel File

**Thanks a lot to @Anankke 、 V2ray Team、 @rico93**

**Note:**
> This edition is only for early adopters experience and technical exchanges. If you want to experience the full-featured edition, please contact @rico93 or [telegram channel](https://t.me/rico_v2)

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

### Start V2ray Node And Enable Auto Start

```
systemctl start v2ray && systemctl enable v2ray
# checkout v2ray status
systemctl status v2ray
● v2ray.service - V2Ray Service
   Loaded: loaded (/etc/systemd/system/v2ray.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2019-10-12 18:37:48 CST; 11s ago
 Main PID: 10450 (v2ray)
   CGroup: /system.slice/v2ray.service
           └─10450 /usr/bin/v2ray/v2ray -config /etc/v2ray/config.json

Oct 12 18:37:48 vultr.guest systemd[1]: Started V2Ray Service.
Oct 12 18:37:48 vultr.guest v2ray[10450]: V2Ray 4.19 (Po) Custom
Oct 12 18:37:48 vultr.guest v2ray[10450]: A unified platform for anti-censorship.
Oct 12 18:37:48 vultr.guest v2ray[10450]: 2019/10/12 18:37:48 [Warning] v2ray.com/core: V2Ray 4.19 started
Oct 12 18:37:51 vultr.guest v2ray[10450]: 2019/10/12 18:37:51 [Warning] SSPanelPlugin: Connected gRPC server "127.0.0.1:2333"
Oct 12 18:37:52 vultr.guest v2ray[10450]: 2019/10/12 18:37:52 [Warning] SSPanelPlugin: Before Update, Current Users 0 need to be add 1 need to be romved 0
Oct 12 18:37:52 vultr.guest v2ray[10450]: 2019/10/12 18:37:52 [Warning] SSPanelPlugin: After Update, Current Users 1 need to be add 0 need to be romved 0

```


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
    location /ws { # 与 V2Ray 配置中的 path 保持一致
      if ($http_upgrade != "websocket") { # WebSocket协商失败时返回404
          return 404;
      }
      proxy_redirect off;
      proxy_pass http://127.0.0.1:7888; # 假设WebSocket监听在环回地址的10000端口上
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