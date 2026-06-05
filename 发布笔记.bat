@echo off
chcp 65001 >nul
echo ========================================
echo   正在同步笔记到 Quartz...
echo ========================================

:: 第一步：从 Obsidian 库同步笔记到 content（排除不需要的文件）
echo.
echo [1/3] 同步 Obsidian 笔记...
robocopy "E:\CS" "C:\Users\huningleda\Desktop\my-notes\content" /E /XD ".obsidian" ".trash" ".git" /XF "*.pdf" "*.html" "*.docx"

:: 第二步：Git 提交
echo.
echo [2/3] 提交变更...
cd /d "C:\Users\huningleda\Desktop\my-notes"
git add .
git commit -m "更新笔记 %date% %time%"

:: 第三步：推送到 GitHub
echo.
echo [3/3] 推送到 GitHub...
git push origin v4

echo.
echo ========================================
echo   完成！等 2 分钟后刷新网页即可
echo   https://foxlog16.github.io/my-notes/
echo ========================================
pause
