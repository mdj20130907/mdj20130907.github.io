docker run \
-it \
--rm \
--name my-test-php \
-v `pwd`:/usr/src/myapp \
-w /usr/src/myapp \
php:7.4-cli php cli.php