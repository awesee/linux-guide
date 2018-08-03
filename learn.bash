#!/bin/bash
# Author: Openset
# Home: https://github.com/openset

# ------------------------------------------------------------------------
# 注释
# ------------------------------------------------------------------------
# 以"#"开头的行就是注释，会被解释器忽略。
# sh里没有多行注释，只能每一行加一个#号。
# 多行注释
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
string="abcd"
echo ${#string}     # 4
# 提取子字符串
string="I love china!"
echo ${string:0:4}  # I lo

