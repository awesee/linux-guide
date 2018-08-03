#!/usr/bin/env bash
# Author: Openset
# Home: https://github.com/openset

# ------------------------------------------------------------------------
# 注释
# ------------------------------------------------------------------------
# 以"#"开头的行就是注释，会被解释器忽略。
# sh里没有多行注释，只能每一行加一个#号。
# 多行注释(非语法)
:<<EOF
注释内容...
注释内容...
注释内容...
EOF

# echo命令
# 双引号完全可以省略
echo string
# 显示普通字符串
echo "It is a string"   # It is a string
# 显示转义字符
echo "\"Hello World!\"" # "Hello World!"
# 显示变量
name=Sandy
echo "Hi, $name"        # Hi, Sandy
# 显示换行
echo -e "OK! \n" # -e 开启转义
echo "It it a test"
# OK!
#
# It it a test
# 显示不换行
echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"
# OK! It is a test
# 显示结果定向至文件
echo "It is a test" > myfile
# 原样输出字符串，不进行转义或取变量(用单引号)
echo '$name\"'
# 显示命令执行结果
echo `date`     # Fri Aug 3 17:16:42 CST 2018
echo $(date)    # Fri Aug 3 17:17:59 CST 2018

# ------------------------------------------------------------------------
# 变量类型
# 1 局部变量
# 2 环境变量 
# 3 shell变量
# ------------------------------------------------------------------------
# 变量
name="Sandy"
echo $name
echo ${name}
# 只读变量
readonly PI=3.1415926
echo PI
# 删除变量
t='abc'
unset t

# ------------------------------------------------------------------------
# 字符串
# ------------------------------------------------------------------------
# 单引号
str='this is a string'
echo $str
# 双引号
str="Hello, I know you are \"$name\"!"
echo $str
# 拼接字符串
world="world"
# 使用双引号拼接
greeting="hello, "$world" !"    # hello, world !
greeting_1="hello, ${world} !"  # hello, world !
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$world' !'  # hello, world !
greeting_3='hello, ${world} !'  # hello, ${world} !
echo $greeting_2  $greeting_3
# 获取字符串长度
string="Hello"
echo ${#string}     # 5
# 提取子字符串
string="I love china!"
echo ${string:0:4}  # I lo

# ------------------------------------------------------------------------
# 数组
# ------------------------------------------------------------------------
# 定义数组
array_name=('value0' 'value1' 'value2' 'value3')
# 读取数组
# 读取数组元素值的一般格式是：
# ${array_name[index]}
# 使用 @ 符号可以获取数组中的所有元素
echo ${array_name[@]}   # value0 value1 value2 value3
echo ${array_name[0]}   # value0
echo ${array_name[2]}   # value2
# 获取数组的长度
# 取得数组元素的个数
length=${#array_name[@]}
echo $length            # 4
# 或者
length=${#array_name[*]}
echo $length            # 4
# 取得数组单个元素的长度
length=${#array_name[1]}
echo $length            # 6

# ------------------------------------------------------------------------
# 传递参数
# ------------------------------------------------------------------------
# 我们可以在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：$n。
# n 代表一个数字，0 为执行的文件名, 1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推……
# 执行的文件名
echo $0     # ./learn.bash
# 传递到脚本的参数个数
echo $#	    # 3
# 以一个单字符串显示所有向脚本传递的参数。
# 如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
echo $*	    # a b c
# 脚本运行的当前进程ID号
echo $$	    # 3664
# 后台运行的最后一个进程的ID号
echo $!     # 3670
# 与$*相同，但是使用时加引号，并在引号中返回每个参数。
# 如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
echo "$@"   # a b c
# 显示Shell使用的当前选项，与set命令功能相同。
echo $-     # hB
# 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
echo $?     # 0

# ------------------------------------------------------------------------
# 基本运算符
# - 算术运算符
# - 关系运算符
# - 布尔运算符
# - 字符串运算符
# - 文件测试运算符
# ------------------------------------------------------------------------

# 算术运算符
# ------------------------------------------------------------------------
# 运算符	    说明      举例
# ------------------------------------------------------------------------
# +	        加法	    `expr $a + $b` 结果为 30。
# -	        减法	    `expr $a - $b` 结果为 -10。
# *	        乘法	    `expr $a \* $b` 结果为  200。
# /	        除法	    `expr $b / $a` 结果为 2。
# % 	    取余	    `expr $b % $a` 结果为 0。
# =	        赋值	    a=$b 将把变量 b 的值赋给 a。
# ==	    相等      用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
# !=	    不相等     用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。
# ------------------------------------------------------------------------
# 注意：条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。
a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"
# a + b : 30
val=`expr $a - $b`
echo "a - b : $val"
# a - b : -10
val=`expr $a \* $b`
echo "a * b : $val"
# a * b : 200
val=`expr $b / $a`
echo "b / a : $val"
# b / a : 2
val=`expr $b % $a`
echo "b % a : $val"
# b % a : 0
if [ $a == $b ]
then
   echo "a 等于 b"
fi

if [ $a != $b ]
then
   echo "a 不等于 b"
fi
# a 不等于 b

# 关系运算符
# ------------------------------------------------------------------------
# 运算符   说明	                                        举例
# ------------------------------------------------------------------------
# -eq     检测两个数是否相等，相等返回 true。	                [ $a -eq $b ] 返回 false。
# -ne	  检测两个数是否不相等，不相等返回 true。	            [ $a -ne $b ] 返回 true。
# -gt	  检测左边的数是否大于右边的，如果是，则返回 true。	    [ $a -gt $b ] 返回 false。
# -lt	  检测左边的数是否小于右边的，如果是，则返回 true。	    [ $a -lt $b ] 返回 true。
# -ge	  检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
# -le	  检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。
# ------------------------------------------------------------------------
a=10
b=20

if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
# 10 -eq 20: a 不等于 b
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
# 10 -ne 20: a 不等于 b
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
# 10 -gt 20: a 不大于 b
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
# 10 -lt 20: a 小于 b
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
# 10 -ge 20: a 小于 b
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi
# 10 -le 20: a 小于或等于 b

# 布尔运算符
# ------------------------------------------------------------------------
# 运算符   说明	                                        举例
# ------------------------------------------------------------------------
# !	      非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
# -o	  或运算，有一个表达式为 true 则返回 true。	        [ $a -lt 20 -o $b -gt 100 ] 返回 true。
# -a	  与运算，两个表达式都为 true 才返回 true。	        [ $a -lt 20 -a $b -gt 100 ] 返回 false。
# ------------------------------------------------------------------------
a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
# 10 != 20 : a 不等于 b
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
# 10 小于 100 且 20 大于 15 : 返回 true
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
# 10 小于 100 或 20 大于 100 : 返回 true
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi
# 10 小于 5 或 20 大于 100 : 返回 false

# 逻辑运算符
# ------------------------------------------------------------------------
# 运算符	说明	        举例
# ------------------------------------------------------------------------
# &&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
# ||	逻辑的 OR	    [[ $a -lt 100 || $b -gt 100 ]] 返回 true
# ------------------------------------------------------------------------

a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
# 返回 false
if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
# 返回 true

# 字符串运算符
# ------------------------------------------------------------------------
# 运算符	说明	                                举例
# ------------------------------------------------------------------------
# =	    检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
# !=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
# -z	检测字符串长度是否为0，为0返回 true。	    [ -z $a ] 返回 false。
# -n	检测字符串长度是否为0，不为0返回 true。	[ -n "$a" ] 返回 true。
# str	检测字符串是否为空，不为空返回 true。	    [ $a ] 返回 true。
# ------------------------------------------------------------------------

a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
# abc = efg: a 不等于 b
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
# abc != efg : a 不等于 b
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
# -z abc : 字符串长度不为 0
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
# -n abc : 字符串长度不为 0
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi
# abc : 字符串不为空

# 文件测试运算符
# ------------------------------------------------------------------------
# 操作符	    说明	                                            举例
# ------------------------------------------------------------------------
# -b file	检测文件是否是块设备文件，如果是，则返回 true。	        [ -b $file ] 返回 false。
# -c file	检测文件是否是字符设备文件，如果是，则返回 true。	    [ -c $file ] 返回 false。
# -d file	检测文件是否是目录，如果是，则返回 true。	            [ -d $file ] 返回 false。
# -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
# -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	    [ -g $file ] 返回 false。
# -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
# -p file	检测文件是否是有名管道，如果是，则返回 true。	        [ -p $file ] 返回 false。
# -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	    [ -u $file ] 返回 false。
# -r file	检测文件是否可读，如果是，则返回 true。	            [ -r $file ] 返回 true。
# -w file	检测文件是否可写，如果是，则返回 true。	            [ -w $file ] 返回 true。
# -x file	检测文件是否可执行，如果是，则返回 true。	            [ -x $file ] 返回 true。
# -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
# -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	    [ -e $file ] 返回 true。
# ------------------------------------------------------------------------
file="./learn.bash"

if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
# 文件可读
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
# 文件可写
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
# 文件可执行
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
# 文件为普通文件
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
# 文件不是个目录
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
# 文件不为空
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi
# 文件存在

