<?php

require_once 'config.php';

$redis = new Redis();
$redis->connect($redis_config['host']);

$lua_script = "return {1,2,3}";
$r = $redis->eval($lua_script);
print_r($r);
