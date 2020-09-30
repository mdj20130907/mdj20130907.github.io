- Any PHP script is built out of a series of `statements`
- A statement can be an assignment, a function call, a loop, a conditional statement or even a statement that does nothing (an empty statement)
- Statements usually end with a semicolon
- statements can be grouped into a statement-group by encapsulating a group of statements with curly braces
- A statement-group is a statement by itself as well



- The following are also considered language constructs even though they are referenced under functions in the manual: list()/array()/echo/eval()
- list($a, $b, $c) = [0=>'a', 1=>'b', 2=>'c',];
- array(1=>'a', 2=>'b', 3=>'c',); [1=>'a', 2=>'b', 3=>'c',]; 后者为精简语法

- echo "Hello World";
- echo 'This ', 'string ', 'was ', 'made ', 'with multiple parameters.', chr(10);
- echo 'This '. 'string '. 'was '. 'made '. 'with concatenation.'.       "\n";

- 1===1 ? echo 'yes' : echo 'no'; 错误的，echo不是函数
- echo 1===1?'yes':'no'; 对的

- echo的精简语法short_open_tag

- echo也可以带括号: echo('hi');

- eval('$a=1;');echo $a;