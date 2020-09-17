# https://hub.docker.com/_/mysql
# 后台启动一个mysqld的container，执行`exec -it`进入该container进行mysql客户端操作

# 启动服务
docker run \
--name my-test-mysql \
--detach \
--env MYSQL_ROOT_PASSWORD=secret \
mysql:8.0

# 进入该container的shell进行操作
echo 'docker exec -it my-test-mysql bash'

# 查看log
echo 'docker logs -f my-test-mysql'
