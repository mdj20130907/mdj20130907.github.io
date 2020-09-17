# 后台启动一个mysqld的container，发布端口；使用host上的mysql客户端操作, 或者使用docker里的mysql操作

# 启动服务
docker run \
--name my-test-mysql \
--detach \
--publish 8306:3306 \
--env MYSQL_ROOT_PASSWORD=secret \
mysql:8.0

# 查看docker的ip
echo 'ip addr show docker0'

# 利用host上的mysql进入
echo 'mysql -h172.17.0.1 -P8306 -uroot -p'
# 利用docker里的mysql客户端
echo 'docker run -it --rm mysql:8.0 mysql -h172.17.0.1 -P8306 -uroot -p'
# 这里可以利用workbench、navicat等客户端工具进行管理操作