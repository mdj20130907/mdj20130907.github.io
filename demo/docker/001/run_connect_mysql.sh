docker run \
--publish 8001:80 \
--detach \
--network my-test-net \
--name my-running-test-app \
my-test-app:1.0

echo '请在浏览器本地8001端口查看输出内容'

# 连接mysql container，需要指定network
