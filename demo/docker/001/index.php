<?php

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
