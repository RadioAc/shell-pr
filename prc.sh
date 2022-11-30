#!/bin/bash 

# 这是单行注释

:<<EOF 
echo '这是多行注释' 
echo '这是多行注释' 
echo '这是多行注释' 
EOF
# help
#  Output: 
# job_spec [&]                            history [-c] [-d offset] [n] or hist>
# (( expression ))                        if COMMANDS; then COMMANDS; [ elif C>
# . filename [arguments]                  jobs [-lnprs] [jobspec ...] or jobs >
# :                                       kill [-s sigspec | -n signum | -sigs>
# [ arg... ]                              let arg [arg ...]
# [[ expression ]]                        local [option] name[=value] ...
# alias [-p] [name[=value] ... ]          logout [n]
# bg [job_spec ...]                       mapfile [-d delim] [-n count] [-O or>
# bind [-lpsvPSVX] [-m keymap] [-f file>  popd [-n] [+N | -N]
# break [n]                               printf [-v var] format [arguments]
# builtin [shell-builtin [arg ...]]       pushd [-n] [+N | -N | dir]
# caller [expr]                           pwd [-LPW]
# case WORD in [PATTERN [| PATTERN]...)>  read [-ers] [-a array] [-d delim] [->
# cd [-L|[-P [-e]] [-@]] [dir]            readarray [-n count] [-O origin] [-s>
# command [-pVv] command [arg ...]        readonly [-aAf] [name[=value] ...] o>
# compgen [-abcdefgjksuv] [-o option] [>  return [n]
# complete [-abcdefgjksuv] [-pr] [-DE] >  select NAME [in WORDS ... ;] do COMM>
# compopt [-o|+o option] [-DE] [name ..>  set [-abefhkmnptuvxBCHP] [-o option->
# continue [n]                            shift [n]
# coproc [NAME] command [redirections]    shopt [-pqsu] [-o] [optname ...]
# declare [-aAfFgilnrtux] [-p] [name[=v>  source filename [arguments]
# dirs [-clpv] [+N] [-N]                  suspend [-f]
# disown [-h] [-ar] [jobspec ... | pid >  test [expr]
# echo [-neE] [arg ...]                   time [-p] pipeline
# enable [-a] [-dnps] [-f filename] [na>  times
# eval [arg ...]                          trap [-lp] [[arg] signal_spec ...]
# exec [-cl] [-a name] [command [argume>  true
# exit [n]                                type [-afptP] name [name ...]
# export [-fn] [name[=value] ...] or ex>  typeset [-aAfFgilnrtux] [-p] name[=v>
# false                                   ulimit [-SHabcdefiklmnpqrstuvxPT] [l>
# fc [-e ename] [-lnr] [first] [last] o>  umask [-p] [-S] [mode]
# fg [job_spec]                           unalias [-a] name [name ...]
# for NAME [in WORDS ... ] ; do COMMAND>  unset [-f] [-v] [-n] [name ...]
# for (( exp1; exp2; exp3 )); do COMMAN>  until COMMANDS; do COMMANDS; done
# function name { COMMANDS ; } or name >  variables - Names and meanings of so>
# getopts optstring name [arg]            wait [-n] [id ...]
# hash [-lr] [-p pathname] [-dt] [name >  while COMMANDS; do COMMANDS; done
# help [-dms] [pattern ...]               { COMMANDS ; }

# 输出普通字符串：
echo "hello, world"
#  Output: hello, world

# 输出含变量的字符串：
name=zp
echo "hello, \"${name}\""
#  Output: hello, "zp"

# 输出含换行符的字符串
echo "YES\nNO"
#  Output: YES\nNO
echo -e "YES\nNO" # -e 开启转义
#  Output:
#  YES
#  NO

# 输出包含颜色的字符串：
echo -e "\033[32m 成功 \033[0m"; # -e 开启转义
#  Output: 成功
echo -e "\033[31m 失败 \033[0m";
#  Output: 失败

# 输出含不换行符的字符串：
echo "YES"
echo "NO"
#  Output:
#  YES
#  NO
echo -e "YES\c" # -e 开启转义 \c 不换行
echo "NO"
#  Output:
#  YESNO

# 输出执行结果
echo `pwd`
#  Output:(当前目录路径)

# 输出重定向至文件
echo "test" > file/test.txt

# 输出执行结果 重定向至文件
echo ${name} >> file/pwd.txt
echo `pwd` > file/pwd.txt
# 其中  > 是覆盖/生成  >> 是追加/生成


# 单引号
printf '%d %s\n' 1 "abc"
#  Output:1 abc

# 双引号
printf "%d %s\n" 1 "abc"
#  Output:1 abc

# 无引号
printf %s abcdef
#  Output: abcdef(并不会换行)

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出
printf "%s\n" abc def
#  Output:
#  abc
#  def

printf "%s %s %s %s\n" a b c d e f g h i j
#  Output:
#  a b c d
#  e f g h
#  i j

# 如果没有参数，那么 %s 用 NULL 代替，%d 用 0 代替
printf "%s and %d \n"
#  Output:
#   and 0

# 格式化输出
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.4f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.0f\n" 郭芙 女 47.9876
#  Output:
#  姓名     性别   体重kg 
#  郭靖     男      66.12
#  杨过     男      48.65
#  郭芙     女      47.99

word="helloword"
echo ${word}
# Output: hello

rword="hellorword"
echo ${rword}
readonly rword
# rword="bye"  # 如果放开注释，执行时会报错  rword: readonly variable

dword="hellodword"  # 声明变量
echo ${dword}  # 输出变量值
# Output: hello
unset dword    # 删除变量
echo ${dword}
# Output: （空）

echo $HOME
echo $PATH
echo $PWD

# 使用单引号拼接
name1='white'
str1='hello, '${name1}''
str2='hello, ${name1}'
echo ${str1}_${str2}
# Output:
# hello, white_hello, ${name1}

# 使用双引号拼接
name2="black"
str3="hello, "${name2}""
str4="hello, ${name2}"
echo ${str3}_${str4}
# Output:
# hello, black_hello, black

text="12345"
echo 'text字符串长度:' ${#text}
# Output:
# text字符串长度: 5

text="12345"
echo ${text:2:2}
# Output:
# 34

text="hello"
echo `expr index "${text}" ll`
# Execute: ./str-demo5.sh
# Output:
# 3

# 创建数组的不同方式
nums=([2]=2 [0]=0 [1]=1)
colors=(red yellow "dark blue")

echo ${nums[1]}
# Output: 1

echo ${colors[*]}
# Output: red yellow dark blue
echo ${colors[@]}
# Output: red yellow dark blue
# 上文的两中访问数组方式是有区别的
printf "+ %s\n" ${colors[*]}
# Output:
# + red
# + yellow
# + dark
# + blue
printf "+ %s\n" "${colors[@]}"
# Output:
# + red
# + yellow
# + dark blue
## 引号内，${colors[@]}将数组中的每个元素扩展为一个单独的参数；数组元素中的空格得以保留。

echo ${nums[@]:0:2}
# Output:
# 0 1

echo ${nums[1]}
# Output:
# 1

echo ${#nums[*]}
# Output:
# 3

colors=(white "${colors[@]}" green black)
echo ${colors[@]}
# Output:
# white red yellow dark blue green black

unset nums[0]
echo ${nums[@]}
# Output:
# 1 2

x=10
y=20

echo "x=${x}, y=${y}"

val=`expr ${x} + ${y}`
echo "${x} + ${y} = $val"

val=`expr ${x} - ${y}`
echo "${x} - ${y} = $val"

val=`expr ${x} \* ${y}`
echo "${x} * ${y} = $val"

val=`expr ${y} / ${x}`
echo "${y} / ${x} = $val"

val=`expr ${y} % ${x}`
echo "${y} % ${x} = $val"

if [[ ${x} == ${y} ]]
then
  echo "${x} = ${y}"
fi
if [[ ${x} != ${y} ]]
then
  echo "${x} != ${y}"
fi
# Output:
# x=10, y=20
# 10 + 20 = 30
# 10 - 20 = -10
# 10 * 20 = 200
# 20 / 10 = 2
# 20 % 10 = 0
# 10 != 20

echo "x=${x}, y=${y}"
if [[ ${x} -eq ${y} ]]; then
   echo "${x} -eq ${y} : x 等于 y"
else
   echo "${x} -eq ${y}: x 不等于 y"
fi
if [[ ${x} -ne ${y} ]]; then
   echo "${x} -ne ${y}: x 不等于 y"
else
   echo "${x} -ne ${y}: x 等于 y"
fi
if [[ ${x} -gt ${y} ]]; then
   echo "${x} -gt ${y}: x 大于 y"
else
   echo "${x} -gt ${y}: x 不大于 y"
fi
if [[ ${x} -lt ${y} ]]; then
   echo "${x} -lt ${y}: x 小于 y"
else
   echo "${x} -lt ${y}: x 不小于 y"
fi
if [[ ${x} -ge ${y} ]]; then
   echo "${x} -ge ${y}: x 大于或等于 y"
else
   echo "${x} -ge ${y}: x 小于 y"
fi
if [[ ${x} -le ${y} ]]; then
   echo "${x} -le ${y}: x 小于或等于 y"
else
   echo "${x} -le ${y}: x 大于 y"
fi
#  Output:
#  x=10, y=20
#  10 -eq 20: x 不等于 y
#  10 -ne 20: x 不等于 y
#  10 -gt 20: x 不大于 y
#  10 -lt 20: x 小于 y
#  10 -ge 20: x 小于 y
#  10 -le 20: x 小于或等于 y

echo "x=${x}, y=${y}"
if [[ ${x} != ${y} ]]; then
   echo "${x} != ${y} : x 不等于 y"
else
   echo "${x} != ${y}: x 等于 y"
fi
if [[ ${x} -lt 100 && ${y} -gt 15 ]]; then
   echo "${x} 小于 100 且 ${y} 大于 15 : 返回 true"
else
   echo "${x} 小于 100 且 ${y} 大于 15 : 返回 false"
fi
if [[ ${x} -lt 100 || ${y} -gt 100 ]]; then
   echo "${x} 小于 100 或 ${y} 大于 100 : 返回 true"
else
   echo "${x} 小于 100 或 ${y} 大于 100 : 返回 false"
fi
if [[ ${x} -lt 5 || ${y} -gt 100 ]]; then
   echo "${x} 小于 5 或 ${y} 大于 100 : 返回 true"
else
   echo "${x} 小于 5 或 ${y} 大于 100 : 返回 false"
fi
#  Output:
#  x=10, y=20
#  10 != 20 : x 不等于 y
#  10 小于 100 且 20 大于 15 : 返回 true
#  10 小于 100 或 20 大于 100 : 返回 true
#  10 小于 5 或 20 大于 100 : 返回 false

echo "x=${x}, y=${y}"
if [[ ${x} -lt 100 && ${y} -gt 100 ]]
then
   echo "${x} -lt 100 && ${y} -gt 100 返回 true"
else
   echo "${x} -lt 100 && ${y} -gt 100 返回 false"
fi
if [[ ${x} -lt 100 || ${y} -gt 100 ]]
then
   echo "${x} -lt 100 || ${y} -gt 100 返回 true"
else
   echo "${x} -lt 100 || ${y} -gt 100 返回 false"
fi
#  Output:
#  x=10, y=20
#  10 -lt 100 && 20 -gt 100 返回 false
#  10 -lt 100 || 20 -gt 100 返回 true


x="abc"
y="xyz"
echo "x=${x}, y=${y}"
if [[ ${x} = ${y} ]]; then
   echo "${x} = ${y} : x 等于 y"
else
   echo "${x} = ${y}: x 不等于 y"
fi
if [[ ${x} != ${y} ]]; then
   echo "${x} != ${y} : x 不等于 y"
else
   echo "${x} != ${y}: x 等于 y"
fi
if [[ -z ${x} ]]; then
   echo "-z ${x} : 字符串长度为 0"
else
   echo "-z ${x} : 字符串长度不为 0"
fi
if [[ -n "${x}" ]]; then
   echo "-n ${x} : 字符串长度不为 0"
else
   echo "-n ${x} : 字符串长度为 0"
fi
if [[ ${x} ]]; then
   echo "${x} : 字符串不为空"
else
   echo "${x} : 字符串为空"
fi
#  Output:
# x=abc, y=xyz
# abc = xyz: x 不等于 y
# abc != xyz : x 不等于 y
# -z abc : 字符串长度不为 0
# -n abc : 字符串长度不为 0
# abc : 字符串不为空


file="/etc/hosts"
if [[ -r ${file} ]]; then
   echo "${file} 文件可读"
else
   echo "${file} 文件不可读"
fi
if [[ -w ${file} ]]; then
   echo "${file} 文件可写"
else
   echo "${file} 文件不可写"
fi
if [[ -x ${file} ]]; then
   echo "${file} 文件可执行"
else
   echo "${file} 文件不可执行"
fi
if [[ -f ${file} ]]; then
   echo "${file} 文件为普通文件"
else
   echo "${file} 文件为特殊文件"
fi
if [[ -d ${file} ]]; then
   echo "${file} 文件是个目录"
else
   echo "${file} 文件不是个目录"
fi
if [[ -s ${file} ]]; then
   echo "${file} 文件不为空"
else
   echo "${file} 文件为空"
fi
if [[ -e ${file} ]]; then
   echo "${file} 文件存在"
else
   echo "${file} 文件不存在"
fi
#  Output:
# /etc/hosts 文件可读
# /etc/hosts 文件可写
# /etc/hosts 文件不可执行
# /etc/hosts 文件为普通文件
# /etc/hosts 文件不是个目录
# /etc/hosts 文件不为空
# /etc/hosts 文件存在

# if
# 写成一行
if [[ 1 -eq 1 ]]; then echo "1 -eq 1 result is: true"; fi
# Output: 1 -eq 1 result is: true
# 写成多行
if [[ "abc" -eq "abc" ]]
then
  echo ""abc" -eq "abc" result is: true"
fi
# Output: abc -eq abc result is: true

if [[ 2 -ne 1 ]]; then
  echo "true"
else
  echo "false"
fi
# Output: true

x=10
y=20
if [[ ${x} > ${y} ]]; then
   echo "${x} > ${y}"
elif [[ ${x} < ${y} ]]; then
   echo "${x} < ${y}"
else
   echo "${x} = ${y}"
fi
# Output: 10 < 20

oper="+"
exec
case ${oper} in
  "+")
    val=`expr ${x} + ${y}`
    echo "${x} + ${y} = ${val}"
  ;;
  "-")
    val=`expr ${x} - ${y}`
    echo "${x} - ${y} = ${val}"
  ;;
  "*")
    val=`expr ${x} \* ${y}`
    echo "${x} * ${y} = ${val}"
  ;;
  "/")
    val=`expr ${x} / ${y}`
    echo "${x} / ${y} = ${val}"
  ;;
  *)
    echo "Unknown oper!"
  ;;
esac
# Output:
# 10 + 20 = 30

for i in {1..5}; do echo $i; done
# Output: 1..5
for (( i = 0; i < 10; i++ )); do
  echo $i
done
# Output: 1..9

DIR=shBack
for FILE in *.sh; do
  cp "$FILE" "${DIR}/scripts"
done
# 将 当前 目录下所有 sh 文件拷贝到 shBack/scripts

### 0到9之间每个数的平方
x=0
while [[ ${x} -lt 10 ]]; do
  echo $((x * x))
  x=$((x + 1))
done
#  Output:
#  0 1 4 8 .. 64 81

### 当 x>5 为 fasle时, 执行内部逻辑 
x=0
until [[ ${x} -ge 5 ]]; do
  echo ${x}
  x=`expr ${x} + 1`
done
#  Output:
#  0 .. 4

# select answer in elem1 elem2 ... elemN
# do
#   ### 语句
# done

# PS3="选择包管理器: "
# select ITEM in bower npm gem pip
# do
# echo -n "Enter the package name: " && read PACKAGE
# case ${ITEM} in
#   bower) echo 'use bower' ;;
#   npm) echo 'use npm' ;;
#   gem) echo 'use gem' ;;
#   pip) echo 'use pip' ;;
# esac
# break # 避免无限循环
# done

# 查找 10 以内第一个能整除 2 和 3 的正整数
i=1
while [[ ${i} -lt 10 ]]; do
  if [[ $((i % 3)) -eq 0 ]] && [[ $((i % 2)) -eq 0 ]]; then
    echo ${i}
    break;
  fi
  i=`expr ${i} + 1`
done
# Output: 6

# 打印10以内的奇数
for (( i = 0; i < 10; i ++ )); do
  if [[ $((i % 2)) -eq 0 ]]; then
    continue;
  fi
  echo ${i}
done
#  Output:
#  1 3 .. 7 9

# [ function ] funname [()] {
#     action;
#     [return int;]
# }

calc(){
  PS3="choose the oper(1:+ 2:- 3:* 4:/): "
  select oper in + - \* / # 生成操作符选择菜单
  do
  echo -n "enter first num: " && read x # 读取输入参数
  echo -n "enter second num: " && read y # 读取输入参数
  exec
  case ${oper} in
    "+")
      return $((${x} + ${y}))
    ;;
    "-")
      return $((${x} - ${y}))
    ;;
    "*")
      return $((${x} * ${y}))
    ;;
    "/")
      return $((${x} / ${y}))
    ;;
    *)
      echo "${oper} is not support!"
      return 0
    ;;
  esac
  break
  done
}
calc
echo "the result is: $?" # $? 获取 calc 函数返回值

x=0
if [[ -n $1 ]]; then
  echo "sh 第一个参数为：$1"
  x=$1
else
  echo "第一个参数为空"
fi

y=0
if [[ -n $2 ]]; then
  echo "sh 第二个参数为：$2"
  y=$2
else
  echo "第二个参数为空"
fi

paramsFunction(){
  echo "函数第一个入参：$1"
  echo "函数第二个入参：$2"
}
paramsFunction ${x} ${y}
# sh prc.sh 1 2
# sh 第一个参数为：1
# sh 第二个参数为：2
# 函数第一个入参：1
# 函数第二个入参：2
# sh prc.sh 
# 第一个参数为空
# 第二个参数为空
# 函数第一个入参：0
# 函数第二个入参：0
# 执行 ./prc.sh x1 x2 x3 ，然后在脚本中通过 $1、$2 ... 读取第 1 个参数、第 2 个参数 等等

runner() {
  return 0
}

name=zp
paramsFunction(){
  echo "paramsFunction函数第一个入参：$1"
  echo "paramsFunction函数第二个入参：$2"
  echo "传递到脚本的参数个数：$#"
  echo "所有参数："
  printf "+ %s\n" "$*"
  echo "脚本运行的当前进程 ID 号：$$"
  echo "后台运行的最后一个进程的 ID 号：$!"
  echo "所有参数："
  printf "+ %s\n" "$@"
  echo "Shell 使用的当前选项：$-"
  runner
  echo "runner 函数的返回值：$?"
}
paramsFunction 1 "abc" "hello, \"zp\""
#  Output:
#  paramsFunction函数第一个入参：1
#  paramsFunction函数第二个入参：abc
#  传递到脚本的参数个数：3
#  所有参数：
#  + 1 abc hello, "zp"
#  脚本运行的当前进程 ID 号：26400
#  后台运行的最后一个进程的 ID 号：
#  所有参数：
#  + 1
#  + abc
#  + hello, "zp"
#  Shell 使用的当前选项：hB
#  runner 函数的返回值：0

# ### ls的结果将会被写到list.txt中
# ls -l > list.txt
# ### 将输出附加到list.txt中
# ls -a >> list.txt
# ### 所有的错误信息会被写到errors.txt中
# grep da * 2> errors.txt
# ### 从errors.txt中读取输入
# less < errors.txt

git branch -a > /dev/null


# 查询当前目录项目git本地及线上分支, 返回分支名中包含 test 的分支 
# git branch -a|grep test 
# 查询当前目录项目git本地及线上分支, 返回分支名匹配当前正则的分支 
# git branch -a|grep -P "v4.0_\d+_fix_dev"

# exit [返回值]

# getopts 入参格式声明 入参命名
# getopts optstring name [arg...]