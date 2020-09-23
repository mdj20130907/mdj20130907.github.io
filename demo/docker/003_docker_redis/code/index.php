<?php

require_once 'config.php';

$redis = new Redis();
$redis->connect($redis_config['host']);

$r = $redis->auth($redis_config['password']);
var_dump($r);

$r = $redis->ping();
var_dump($r);