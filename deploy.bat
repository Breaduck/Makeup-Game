@echo off
echo ================================
echo Auto Deploy to GitHub + Cloudflare
echo ================================
echo.

REM 변경사항 확인
echo [1/4] Checking changes...
git status
echo.

REM 모든 변경사항 추가
echo [2/4] Adding changes...
git add .
echo.

REM 커밋 메시지 입력 받기
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Update game files

REM 커밋
echo [3/4] Committing...
git commit -m "%commit_msg%"
echo.

REM Push to GitHub
echo [4/4] Pushing to GitHub...
git push origin main
echo.

echo ================================
echo Deploy Complete!
echo GitHub will auto-deploy to Cloudflare Pages
echo ================================
pause
