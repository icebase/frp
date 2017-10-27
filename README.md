# FRP server for Docker

本镜像用于构建 frp 服务器端

### 快速使用

以下命令创建 frp 服务端容器，客户端可以通过 `7000` 号端口连通。

```
sudo docker run -d \
    -v ~/frp/:/etc/frp \
    -p 7000:7000 \
    --name getnas/frp
```

>提示：`~/frp` 为本地放置 `frps.ini` 配置文件的目录请自行创建，将映射到容器的 `/etc/frp` 默认的配置目录。

### 映射使用的端口

假设需要将服务端上 `6000` 端口映射给客户端的 `ssh` 服务使用，则使用以下命令创建镜像。需要映射其他端口也是一样，只要在命令中附加 `-p port:port` 即可。

```
sudo docker run -d \
    -v ~/frp/:/etc/frp \
    -p 7000:7000 \
    -p 6000:6000 \
    --name getnas/frp
```

### 使用 docker-compose 管理容器

