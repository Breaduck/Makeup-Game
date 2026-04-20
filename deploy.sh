#!/bin/bash

echo "================================"
echo "Auto Deploy to GitHub + Cloudflare"
echo "================================"
echo ""

# 변경사항 확인
echo "[1/4] Checking changes..."
git status
echo ""

# 모든 변경사항 추가
echo "[2/4] Adding changes..."
git add .
echo ""

# 커밋 메시지 입력
echo "[3/4] Committing..."
read -p "Enter commit message (or press Enter for default): " commit_msg
commit_msg=${commit_msg:-"Update game files"}

git commit -m "$commit_msg"
echo ""

# Push to GitHub
echo "[4/4] Pushing to GitHub..."
git push origin main
echo ""

echo "================================"
echo "Deploy Complete!"
echo "GitHub will auto-deploy to Cloudflare Pages"
echo "================================"
