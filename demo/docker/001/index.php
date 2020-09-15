<p>表单里提交的余额会在后台记入磁盘，测试下次启动磁盘是否保存了上次记录的余额</p>
<p>
    <form method="POST">
        <input type="text" name="balance">
        <input type="submit" value="记录余额">
    </form>
    <a href="balance.txt">查看上次记录的余额</a>
</p>

<?php

// 改写一个文件的内容，测试`docker run --mount`
if(array_key_exists('balance', $_POST)){
    file_put_contents('balance.txt', $_POST['balance']);
}


// 测试mysql
try {
    $mysqlHost = '172.18.0.2';// 借助nicolaka/netshoot镜像获得
    $mysqlHost = 'mysql';// 因为ip会变
    // demo/docker/001/docker-compose.yml: We can pick any name for the service. The name will automatically become a network alias, which will be useful when defining our MySQL service.
    $dbh = new PDO("mysql:host=$mysqlHost;dbname=test", 'root', 'secret');
    foreach($dbh->query('show databases') as $row) {
        print_r($row);
        print '<br/>';
    }
    print '<br/>';
    $dbh = null;
} catch (PDOException $e) {
    print 'Error!: ' . $e->getMessage() . '<br/>';
}


function f1($a1){
    echo '<pre>';
    echo $a1;
    echo '</pre>';
    echo '<br>';
}

f1(`pwd`);
f1(`ls -alh`);
f1(`df -h`);

phpinfo();
