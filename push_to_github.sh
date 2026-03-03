#!/bin/bash

# GitHub 报告推送脚本
# 使用方法：./push_to_github.sh

REPO_URL="https://github.com/Gibo-Chun/Resarch_Report.git"
REPO_NAME="Resarch_Report"
GITHUB_USER="Gibo-Chun"

echo "=========================================="
echo "  GitHub Pages 报告推送工具"
echo "=========================================="
echo ""
echo "目标仓库：https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo ""

# 检查 git 配置
cd /home/admin1/.openclaw/workspace

echo "步骤 1/4: 配置 Git 用户信息..."
git config user.name "Gibo-Chun"
git config user.email "gibo.chun@example.com"
echo "✓ Git 用户信息已配置"
echo ""

echo "步骤 2/4: 添加所有 HTML 报告文件..."
git add *.html
git status --short
echo ""

echo "步骤 3/4: 提交更改..."
git commit -m "Auto-update: Add/Update HTML Reports ($(date +%Y-%m-%d))"
echo "✓ 提交完成"
echo ""

echo "步骤 4/4: 推送到 GitHub..."
echo ""
echo "请输入您的 GitHub Personal Access Token:"
echo "(获取方式：GitHub → Settings → Developer settings → Personal access tokens → Generate new token)"
echo "需要勾选的权限：repo (Full control of private repositories)"
echo ""
read -s GITHUB_TOKEN
echo ""
echo ""

# 设置远程仓库（带认证）
git remote remove origin 2>/dev/null
git remote add origin "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"

# 推送
git push -u origin master

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "  ✓ 推送成功！"
    echo "=========================================="
    echo ""
    echo "接下来请启用 GitHub Pages："
    echo "1. 访问：https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo "2. Source 选择：Deploy from a branch"
    echo "3. Branch 选择：master / root"
    echo "4. 点击 Save"
    echo ""
    echo "启用后，您的报告将可通过以下地址访问："
    echo "https://${GITHUB_USER}.github.io/${REPO_NAME}/iphone_vs_domestic_price_report.html"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "  ✗ 推送失败"
    echo "=========================================="
    echo ""
    echo "可能的原因："
    echo "1. Token 无效或过期"
    echo "2. 仓库不存在（请先在 GitHub 创建空仓库）"
    echo "3. 网络问题"
    echo ""
fi
