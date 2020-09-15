docker run \
--publish 8001:80 \
--detach \
--mount type=bind,source=`pwd`,destination=/var/www/html/ \
--name my-running-test-app \
my-test-app:1.0

echo '请在浏览器本地8001端口查看输出内容'

# 不会把docker image中原目录中的文件拷贝到绑定的目录，image中的原目录内容会被覆盖掉不可见了
# 适合源码，日志也可以啊；权限怎么处理