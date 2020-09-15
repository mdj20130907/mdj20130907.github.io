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
