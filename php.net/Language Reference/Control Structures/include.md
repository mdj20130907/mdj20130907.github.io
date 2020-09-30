### include
- The `include` statement includes and evaluates the specified file
- 相当于把代码拷贝过来了, 但是被include的文件可以return值
- https://www.php.net/manual/en/ini.core.php#ini.include-path
- https://www.php.net/manual/en/filesystem.configuration.php#ini.allow-url-include
- emit an E_WARNING if it cannot find a file

- 如果在函数体内include，则相当于代码被拷贝到了函数体内

- if ( include('vars.php') == TRUE) {// 错误
- if ((include 'vars.php') == TRUE) {// 正确

### require
- E_ERROR

### include_once

### require_once
