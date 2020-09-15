docker run \
--publish 8001:80 \
--detach \
--mount type=volume,source=my-test-vol,destination=/var/www/html/ \
--name my-running-test-app \
my-test-app:1.0

echo '请在浏览器本地8001端口查看输出内容'

# 加了mount后，重新build后再run，index.php的修改没有反应出来。需要删除volume后重来。
# 适合log日志等数据，不适合源代码
