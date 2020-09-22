<?php

$redis = new Redis();
$redis->connect('redis');// `redis`是`docker-compose.yml`文件里的`services`名称

$r = $redis->auth('123456');
var_dump($r);

$r = $redis->ping();
var_dump($r);