#!/bin/bash

:<<EOF 
echo '这是多行注释' 
echo '这是多行注释' 
echo '这是多行注释' 
EOF
# 这是单行注释
# 项目分支切换main函数
statrGitOperate()
{   echo work_path: $work_path;
    echo project_path: $work_path/$currentProjectPath;
    echo origin_branch: $origin_branch;
    echo new_branch: $new_branch;
    cd $work_path/$currentProjectPath;
    
    git pull --all;
    # $? 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
    if [ "$?" = "0" ]; then
        echo -e "\033[32m 项目 $currentProjectPath 拉取全部分支成功 SUCCESS \033[0m";
        git_checkout_new
    else
        echo -e "\033[31m 项目 $currentProjectPath 拉取全部分支失败 Failed \033[0m";
        git_log_show
    fi
}
# 切换源分支
git_checkout_origin () {
    git checkout $origin_branch
    if [ "$?" = "0" ]; then
        echo -e "\033[32m 项目 $currentProjectPath 源分支 $origin_branch 切换 SUCCESS \033[0m";
        git_checkout_new_create
    else
        echo -e "\033[31m 项目 $currentProjectPath 源分支 $origin_branch 切换 Failed \033[0m";
        git_log_show
    fi
}
# 验证新分支存在
git_checkout_new () {
    git checkout $new_branch
    if [ "$?" = "0" ]; then
        echo -e "\033[32m 项目 $currentProjectPath 新分支 $new_branch 已存在,当前项目流程结束 \033[0m";
        echo -e ""
        # git_log_show
    else
        echo -e "\033[31m 项目 $currentProjectPath 新分支 $new_branch 不存在 \033[0m";
        git_checkout_origin
    fi
}
# 创建并切换新分支
git_checkout_new_create () {
    git checkout -B $new_branch
    if [ "$?" = "0" ]; then
        echo -e "\033[32m 项目 $currentProjectPath 新分支 $new_branch 新建&切换 SUCCESS \033[0m";
        git_push_new
    else
        echo -e "\033[31m 项目 $currentProjectPath 新分支 $new_branch 新建&切换 Failed \033[0m";
        git_log_show
    fi
}
# 推送新分支
git_push_new () {
    git push --set-upstream origin $new_branch
    if [ "$?" = "0" ]; then
        echo -e "\033[32m 项目 $currentProjectPath 新分支 $new_branch 推送 SUCCESS \033[0m";
    else
        git_log_show "\033[31m 项目 $currentProjectPath 新分支 $new_branch 推送 Failed \033[0m"
    fi
}
# 显示错误信息
git_log_show () {
    echo -e "\033[32m 项目 $currentProjectPath 流程停止 \033[0m";
    git log
    echo -e ""
}
# 使用提示消息
usage()
{
    echo "Usage ./update_service.sh [-d] [dirPath] [-o] [originbranch] [-n] [newBrnach]";
}
# 当入参不足6个时, 显示usage 并退出
if [ $# -lt 6 ]; then
    usage;
    exit -1;
fi
# 入参解析 需 A:B: 格式
while getopts d:o:n: arg
do
    case $arg in 
        d) 
            work_path=$OPTARG;;
            # echo work_path: $work_path;;
        o) 
            origin_branch=$OPTARG;;
            # echo origin_branch: $origin_branch;;
        n) 
            new_branch=$OPTARG;;
            # echo new_branch: $new_branch;;
        :)  # 没有为需要参数的选项指定参数
            echo "This option -$OPTARG requires an argument."
            exit 1 ;;
        ?) # 发现了无效的选项
            echo "-$OPTARG is not an option"
            exit 2 ;;
    esac
done
# 项目文件夹名称数组
projectArr=(git-project-1 git-project-2)
# sh脚本启动判定
if [ -z $work_path ] || [ -z $origin_branch ] || [ -z $new_branch ]; then
    # 当必传入参缺失时, 显示usage 并退出
    # exit 退出sh
    usage;
    exit -1;
else
    # echo "Current Work Path $work_path"
    # 当必传入参完全时, 根据 projectArr 循环调用 项目分支切换函数
    # ${!projectArr[@]} 获取数组中所有键
    # ${projectArr[@]} 获取数组中所有元素
    for i in "${!projectArr[@]}";
    do
        currentProjectPath=${projectArr[$i]}
        statrGitOperate
        # printf "%s\t%s\n" "$i" "${projectArr[$i]}"
    done
fi
