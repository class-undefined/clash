# Kubernetes 部署

本项目包含了使用 Kubernetes 部署和管理 Clash 容器的相关操作。以下是各文件和脚本的功能说明：

- `build.sh`: 构建 Clash 容器镜像的脚本。请根据需要修改镜像构建的相关参数。
- `install.sh`: 安装 Clash 容器的脚本，将创建 Deployment 和 Service。
- `port-forward.sh`: 启动端口转发，将本地端口与 Clash 容器内部的端口进行映射。
- `uninstall.sh`: 卸载 Clash 容器及其相关资源的脚本。

以上脚本请确保在仓库目录下执行，而不是在k8s目录下。

## 使用方法

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