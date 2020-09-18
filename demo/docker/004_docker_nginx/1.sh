docker run \
--name my-test-nginx \
-v `pwd`:/usr/share/nginx/html:ro \
-d \
nginx:1.19

# 获取ip
IP=`docker container inspect -f "{{.NetworkSettings.IPAddress}}" my-test-nginx`
# 提示查看地址
echo '浏览器打开-> http://'$IP
