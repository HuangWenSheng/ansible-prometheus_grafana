#!/bin/bash
#Desc: Copy prometheus grafana software package to ansible roles dir
pg="pgpackage.tar.gz"
md5="a253f06acde16502d7d903e6915ca30a"
if [ -f "/root/package/${pg}" ] && [ `md5sum /root/package/${pg} |awk '{print $1}'` == ${md5} ]; then
    echo "正在将软件包copy到ansible-roles相应目录,请稍等..."
    tar xf /root/package/${pg} -C /root/package/ && \
    tar xf /root/package/pgpackage/grafana.tar.gz -C ./roles/grafana/files/ && \
    cp /root/package/pgpackage/prometheus-2.17.1.linux-amd64.tar.gz ./roles/prometheus/files/
    cp /root/package/pgpackage/node_exporter-1.0.0-rc.0.linux-amd64.tar.gz ./roles/node_exporter/files/
    echo "软件包已准备完毕，可以执行playbook"
else
    echo "请检查${pg}软件包是否存在/root/package目录，并且是否为正确的软件包" && exit
fi
