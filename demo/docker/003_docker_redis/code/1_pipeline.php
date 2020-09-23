<?php

require_once 'config.php';

$redis = new Redis();
$r = $redis->connect($redis_config['host']);
var_dump($r);

$count = 100;

// 不用pipeilne
$start = microtime(true);
for ($i=0; $i < $count; $i++) { 
    $redis->incr('a');
}
$end = microtime(true);
$usedTime = bcsub($end, $start, 4);
echo $usedTime.PHP_EOL;

// 用pipeline
$start = microtime(true);
$pipe = $redis->multi(Redis::PIPELINE);   //开启管道
for ($i=0; $i < $count; $i++) { 
    $pipe->incr('b');
}
$pipe->exec();   //提交管道里操作命令
$end = microtime(true);
$usedTime = bcsub($end, $start, 4);
echo $usedTime.PHP_EOL;
