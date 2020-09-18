docker run \
--name my-test-nginx \
-v `pwd`:/usr/share/nginx/html:ro \
-p 8080:80 \
-d \
nginx:1.19

# 暴露端口访问

# 提示查看地址
echo '浏览器打开-> http://localhost:8080'
