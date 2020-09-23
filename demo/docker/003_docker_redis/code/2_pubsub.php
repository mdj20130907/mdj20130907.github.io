<?php

require_once 'config.php';

$redis = new Redis();
$redis->connect($redis_config['host']);

function cb1($redis, $chan, $msg){
    echo $msg.PHP_EOL;
}

function cb2($redis, $pattern, $channel, $msg){
    echo $channel.':'.$msg.PHP_EOL;
}

switch ($argv[1]) {
    case 'pub':
        // 发布: php this.php pub channel1 hi,there
        $redis->publish($argv[2], $argv[3]); // send message.
        break;
    case 'sub':
        // 订阅: php this.php sub channel1
        $redis->subscribe([$argv[2]], 'cb1');
        break;
    case 'psub':
        $redis->pSubscribe([$argv[2]], 'cb2');
        break;
}
