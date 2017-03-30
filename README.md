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