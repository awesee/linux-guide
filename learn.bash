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

# 输出
echo "Hello World !"

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

