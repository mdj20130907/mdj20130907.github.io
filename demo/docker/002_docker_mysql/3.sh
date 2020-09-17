# 后台启动一个mysqld的container；另外启动一个mysql的container利用docker的network进行访问

# 建立网络
docker network create my-test-net

# 启动服务，并指定网络别名
docker run \
--name my-test-mysql \
--network my-test-net \
--network-alias mysql \
--detach \
--env MYSQL_ROOT_PASSWORD=secret \
mysql:8.0

# 启动客户端
echo "docker run -it --network my-test-net --rm mysql:8.0 mysql -hmysql -uroot -p"