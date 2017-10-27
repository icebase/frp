# FRP server for Docker

本镜像用于构建 frp 服务器端

### 快速使用

```
sudo docker run -d \
    -v ~/frp/:/etc/frp \
    -p 7000:7000 \
    --name getnas/frp
```

>提示：`~/frp` 为本地放置 `frps.ini` 配置文件的目录请自行创建，将映射到容器的 `/etc/frp` 默认的配置目录。