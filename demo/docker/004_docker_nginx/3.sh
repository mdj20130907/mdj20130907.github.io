# 启动一个临时的
# docker run --name tmp-nginx-container -d nginx:1.19

# 拷贝一份配置文件出来
# docker cp tmp-nginx-container:/etc/nginx/nginx.conf `pwd`/nginx.conf

# 删除临时的
# docker rm -f tmp-nginx-container

docker run \
--name my-test-nginx \
-v `pwd`/nginx.conf:/etc/nginx/nginx.conf:ro \
-d \
nginx:1.19