# Clash Docker 镜像
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


这是一个基于 [Dreamacro/clash](https://github.com/Dreamacro/clash) 项目二进制文件构建的 Docker 镜像封装，旨在方便构建和运行 Clash 代理。

## 使用方法

1. 克隆或下载本项目到本地。

2. 确保您的系统已安装 Docker。如果尚未安装，请根据您的操作系统文档进行安装。

3. 打开终端，导航到本项目的根目录。

4. 执行 `build.sh` 脚本并指定 Clash 的订阅链接作为参数：

   ```bash
   ./build.sh <订阅链接>
   ```

> 替换 `<订阅链接>` 为您要使用的 Clash 订阅链接。该脚本将自动构建一个使用指定订阅链接的 Clash Docker 镜像。

1. 构建成功后，可以运行以下命令来启动 Clash 代理容器：

   ```bash
   docker run -d --name clash-proxy -p 7890:7890 -p 7891:7891 <镜像名称>
   ```

   将 `<镜像名称>` 替换为之前构建的 Clash Docker 镜像的名称。

2. Clash 代理容器将在后台运行，并在本地端口 `7890` 上提供 HTTP 代理和 `7891` 上提供 SOCKS5 代理。您可以根据需要调整端口映射设置。

3. 配置您的设备或应用程序以使用 Clash 代理。请参考 [Clash 文档](https://github.com/Dreamacro/clash#how-to-use) 了解如何配置不同设备和应用程序。

## 注意事项

- 在使用 `build.sh` 构建镜像之前，请确保您已安装 Docker，并且能够在终端中执行 `docker` 命令。
- 请注意订阅链接的有效性和安全性。确保订阅链接来自可信任的来源。
- Clash Docker 容器在启动后会自动加载订阅链接，并更新代理规则。您可以根据需要自定义 Clash 的配置文件，并将其挂载到容器中。
- 有关 Clash 的更多配置选项和功能，请参阅 [Clash 文档](https://github.com/Dreamacro/clash)。
- 请遵守相关法律法规并在合法的范围内使用 Clash 代理。


