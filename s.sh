#!/bin/bash

# 定义Lua编译器路径（根据实际安装位置修改）
LUAC="luajit"  # 默认路径
# LUAC="$HOME/lua-5.4.3/src/luac"  # 自定义路径示例

# 清理并创建构建目录
rm -rf ../build
mkdir -p ../build/resources
# 遍历所有.lua文件
find . -type f -name "*.lua" | while read -r file; do
    # 跳过隐藏文件和指定目录
    if [[ $file == *"/."* ]] || [[ $file == *"/test/"* ]]; then
        continue
    fi

    # 生成目标路径
    target="../build/${file#./}"
    target_dir=$(dirname "$target")

    # 创建目录并编译
    mkdir -p "$target_dir"
    "$LUAC" -b "$file" "${target%.lua}.lua"

    # 显示进度
    echo "编译: $file -> ${target%.lua}.lua"
done
cp -r resources/* ../build/resources/
cp main.lua ../build/main.lua
rm ../build/defines.lua
