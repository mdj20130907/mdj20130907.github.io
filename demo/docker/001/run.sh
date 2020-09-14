docker run \
--publish 8000:80 \
--detach \
--name my-running-test-app \
my-test-app:1.0

echo '请在浏览器本地8000端口查看输出内容'
