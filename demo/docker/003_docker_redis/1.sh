docker run \
--name my-test-redis \
--detach \
redis:6.0 redis-server --appendonly yes

# 查看一下redis的ip
echo 'docker container inspect my-test-redis'

# 连接
echo 'docker run -it --network bridge --rm redis:6.0 redis-cli -h 172.17.0.2'