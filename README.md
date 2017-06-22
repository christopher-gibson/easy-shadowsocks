# Easy Shadowsocks

`easy-shadowsocks` is a small bash script to get shadowsocks up and running quickly
using docker and the docker image from `easypi/shadowsocks-libev`.

## Prerequisites

* Docker

## Getting Started

```bash
# Create a container named shadowsocks-80 with port 80 published
./easyss.sh --port 80 --password 5aJdf8Alkh2

# Stop the container
docker kill shadowsocks-80
```

