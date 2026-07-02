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
if not exist "D:\Program Files (x86)\Cheat Engine\languages" (
    mkdir "D:\Program Files (x86)\Cheat Engine\languages"
)

:: 清空目标zh_cn文件夹（如果存在），确保复制前是干净的
if exist "D:\Program Files (x86)\Cheat Engine\languages\zh_cn" (
    rd /s /q "D:\Program Files (x86)\Cheat Engine\languages\zh_cn"
)

:: 使用xcopy命令复制文件夹，/E表示复制所有子目录和文件，/Y表示自动覆盖已存在的文件
xcopy "zh_cn" "D:\Program Files (x86)\Cheat Engine\languages\zh_cn\" /E /Y /I

echo 复制完成！
:: 尝试删除旧的压缩包文件，忽略错误
del /Q "%USERPROFILE%\Desktop\CE7.7墓墓汉化.rar" 2>nul
:: 使用WinRAR压缩文件夹并设置压缩级别和密码
"C:\Program Files\WinRAR\WinRAR.exe" a -r -ep1 -m5 "%USERPROFILE%\Desktop\CE7.7墓墓汉化.rar" "D:\Program Files (x86)\Cheat Engine"
echo 压缩完成！