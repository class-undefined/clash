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
   docker run -d --name clash-proxy -p 7890:7890 -p 9090:9090 <镜像名称>
   ```

   将 `<镜像名称>` 替换为之前构建的 Clash Docker 镜像的名称。

2. Clash 代理容器将在后台运行，并在本地端口 `7890` 上提供 HTTP 代理和 `7891` 上提供 SOCKS5 代理。您可以根据需要调整端口映射设置。

3. 配置您的设备或应用程序以使用 Clash 代理。请参考 [Clash 文档](https://github.com/Dreamacro/clash#how-to-use) 了解如何配置不同设备和应用程序。

## Kubernetes 部署

本项目包含了使用 Kubernetes 部署和管理 Clash 容器的相关操作。以下是各文件和脚本的功能说明：

- `build.sh`: 构建 Clash 容器镜像的脚本。请根据需要修改镜像构建的相关参数。
- `install.sh`: 安装 Clash 容器的脚本，将创建 Deployment 和 Service。
- `port-forward.sh`: 启动端口转发，将本地端口与 Clash 容器内部的端口进行映射。
- `uninstall.sh`: 卸载 Clash 容器及其相关资源的脚本。

### 使用方法

1. 在运行脚本之前，请确保已经正确安装并配置了 Kubernetes 环境，并具有足够的权限。

2. 执行 `k8s/build.sh` 脚本来构建 Clash 容器镜像，并根据需要进行参数调整。

   ```bash
   ./k8s/build.sh <subscribe_address>
   ```
3. 运行 `k8s/install.sh` 脚本以部署 Clash 容器，并创建相应的 Deployment 和 Service。

   ```bash
   ./k8s/install.sh
   ```

   这将使用 `yamls/deployment.yaml` 和 `yamls/service.yaml` 中定义的规范创建 Kubernetes 资源。
   之后可通过`kubectl get pods -n clash` 查看pod状态以及通过`kubectl get svc -n clash`查看新创建的svc。

4. 如果需要在本地访问 Clash 容器内部的服务，可以使用 `k8s/port-forward.sh` 脚本启动端口转发。

   ```bash
   ./k8s/port-forward.sh <clash_pod_id>
   ```

   这将创建端口转发，并将本地端口与 Clash 容器内部的端口进行映射。

5. 如果要卸载 Clash 容器及其相关资源，可以运行 `k8s/uninstall.sh` 脚本。

   ```bash
   ./k8s/uninstall.sh
   ```

   这将删除 Clash 容器、Deployment、Service 等 Kubernetes 资源。

以上脚本请确保在仓库目录下执行，而不是在k8s目录下。
## 注意事项

- 在使用 `build.sh` 构建镜像之前，请确保您已安装 Docker，并且能够在终端中执行 `docker` 命令。
- 请注意订阅链接的有效性和安全性。确保订阅链接来自可信任的来源。
- Clash Docker 容器在启动后会自动加载订阅链接，并更新代理规则。您可以根据需要自定义 Clash 的配置文件，并将其挂载到容器中。
- 有关 Clash 的更多配置选项和功能，请参阅 [Clash 文档](https://github.com/Dreamacro/clash)。
- 请遵守相关法律法规并在合法的范围内使用 Clash 代理。


