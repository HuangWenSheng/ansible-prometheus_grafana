# 部署 `prometheus+grafana`

## 部署hosts文件示例：

**说明：**

```shell
  1. 下载软件包pgpackage.tar.gz并上传到/root/package目录
        链接：`https://pan.baidu.com/s/1P-xSjZWsFUWR10yWM0nbRw`   提取码：7ukr 
        MD5：a253f06acde16502d7d903e6915ca30a
  2. 执行init.sh脚本
  3. 改hosts配置
  4. 直接执行`# ansible-playbook -i hosts promemtheus_grafana.yml `
```



```shell
##########
[prometheus]
192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" targets=192.168.2.29
# targets 定义prometheus监听地址


##########
[grafana]
192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123" http_addr=192.168.2.29
# http_addr 定义grafana监听地址


##########
#[node_exporter]
#192.168.2.29 ansible_ssh_port=22 ansible_ssh_user=root ansible_ssh_pass="test@123"
```



**测试说明：**

```shell
1.prometheus测试，访问部署完的节点的9090端口
   `http://IP:9090`
2.grafana测试，访问部署完的节点的3000端口，默认账户admin/admin
   `http://IP:3000`
3.node_exporter测试
   `http://IP:9100`

```

