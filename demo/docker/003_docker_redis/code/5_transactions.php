<?php

require_once 'config.php';

$redis = new Redis();
$redis->connect($redis_config['host']);

switch ($argv[1]) {
    case 'set_a_forever':
        // 持续不断设置a的值
        while (true) {
            $redis->set('a', time());
        }
        break;
    case 'try_set_a_b':
        $redis->watch('a');// Optimistic locking using check-and-set
        $r = $redis->multi()// Transactions
            ->get('a')
            ->set('b', 'done')
            ->exec();
        var_dump($r);
        break;
}

