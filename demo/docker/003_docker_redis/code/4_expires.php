<?php

require_once 'config.php';

$redis = new Redis();
$redis->connect($redis_config['host']);

$redis->set('x', '1');
$redis->expire('x', 3);// 3s后过期
sleep(5);
$r = $redis->get('x');

var_dump($r);
