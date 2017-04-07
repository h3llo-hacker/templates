# About
起名字是最烦人的事情，没有之一。

这里存放着一些漏洞训练模板。


# Compose Documents

<https://docs.docker.com/compose/compose-file/>

# A Simple Example

```bash
version: "3"
services:
  nginx:
    image: nginx:latest
    environment:
      - FLAG=<FLAG>
    ports:
      - 80
    deploy:
      placement:
        constraints:
          - node.role != manager
      resources:
        limits:
          cpus: '0.05'
          memory: 50M
        reservations:
          cpus: '0.001'
          memory: 10M
```

# Build Services

- Use `alpine` as the base image as can as possible.

Tips: You can use `wrfly/alpine-cn:latest` to get a better download/install speed in the container.

- Each service has one public port at most.(I'm tring to make it more.)

- The service use `FLAG` environment as the input flag.

# How to Name the Templates

```
wrfly/brute_force-mongodb:latest
<user>/<cate>-<service>:latest
```

The tag is reserved for other usage such as different version of the service.