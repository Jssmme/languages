@echo off
chcp 65001
echo 正在复制zh_cn文件夹到目标位置...

:: 检查源文件夹是否存在
if not exist "zh_cn" (
    echo 错误：源文件夹zh_cn不存在！
    pause
    exit /b 1
)

:: 检查目标路径是否存在，如果不存在则创建
if not exist "D:\Program Files (x86)\Cheat Engine 7.6\languages" (
    mkdir "D:\Program Files (x86)\Cheat Engine 7.6\languages"
)

:: 使用xcopy命令复制文件夹，/E表示复制所有子目录和文件，/Y表示自动覆盖已存在的文件
xcopy "zh_cn" "D:\Program Files (x86)\Cheat Engine 7.6\languages\zh_cn" /E /Y

if %errorlevel% equ 0 (
    echo 复制完成！
) else (
    echo 复制过程中出现错误！
)