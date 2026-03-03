#!/bin/bash

# OpenClaw 研究报告自动部署脚本
# 功能：自动检测新的 HTML 报告并推送到 GitHub Pages

set -e

WORKSPACE="/home/admin1/.openclaw/workspace"
REPO_NAME="Resarch_Report"
GITHUB_USER="Gibo-Chun"

echo "=========================================="
echo "  📊 OpenClaw 研究报告自动部署工具"
echo "=========================================="
echo ""

cd "$WORKSPACE"

# 检查 git 状态
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ 错误：当前目录不是 git 仓库"
    exit 1
fi

# 获取当前分支
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "✓ 当前分支：$CURRENT_BRANCH"

# 检查远程仓库
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE_URL" ]; then
    echo "❌ 错误：未配置远程仓库"
    echo "请运行：git remote add origin git@github.com:${GITHUB_USER}/${REPO_NAME}.git"
    exit 1
fi
echo "✓ 远程仓库：$REMOTE_URL"
echo ""

# 查找所有 HTML 文件
echo "📁 扫描 HTML 报告文件..."
echo ""

HTML_FILES=()
NEW_FILES=()
MODIFIED_FILES=()

while IFS= read -r -d '' file; do
    HTML_FILES+=("$file")
    
    # 检查文件状态
    STATUS=$(git status --porcelain "$file" 2>/dev/null | head -1)
    if [[ "$STATUS" =~ ^\?\? ]]; then
        NEW_FILES+=("$file")
    elif [[ -n "$STATUS" ]]; then
        MODIFIED_FILES+=("$file")
    fi
done < <(find . -maxdepth 1 -name "*.html" -type f -print0)

echo "找到 ${#HTML_FILES[@]} 个 HTML 文件："
for file in "${HTML_FILES[@]}"; do
    basename "$file"
done
echo ""

# 如果没有新文件或修改文件
if [ ${#NEW_FILES[@]} -eq 0 ] && [ ${#MODIFIED_FILES[@]} -eq 0 ]; then
    echo "✅ 所有报告已是最新，无需推送"
    exit 0
fi

# 显示变更
if [ ${#NEW_FILES[@]} -gt 0 ]; then
    echo "🆕 新增文件 (${#NEW_FILES[@]}):"
    for file in "${NEW_FILES[@]}"; do
        echo "   + $(basename "$file")"
    done
    echo ""
fi

if [ ${#MODIFIED_FILES[@]} -gt 0 ]; then
    echo "📝 修改文件 (${#MODIFIED_FILES[@]}):"
    for file in "${MODIFIED_FILES[@]}"; do
        echo "   ~ $(basename "$file")"
    done
    echo ""
fi

# 添加文件到 git
echo "⏳ 添加到 git..."
git add "${HTML_FILES[@]}"
echo "✓ 添加完成"
echo ""

# 创建提交信息
COMMIT_MSG="Auto-deploy: Update HTML Reports ($(date +%Y-%m-%d %H:%M))"

if [ ${#NEW_FILES[@]} -gt 0 ] && [ ${#MODIFIED_FILES[@]} -gt 0 ]; then
    COMMIT_MSG="Auto-deploy: Add ${#NEW_FILES[@]} new and update ${#MODIFIED_FILES[@]} existing reports"
elif [ ${#NEW_FILES[@]} -gt 0 ]; then
    COMMIT_MSG="Auto-deploy: Add ${#NEW_FILES[@]} new report(s)"
elif [ ${#MODIFIED_FILES[@]} -gt 0 ]; then
    COMMIT_MSG="Auto-deploy: Update ${#MODIFIED_FILES[@]} report(s)"
fi

# 提交
echo "⏳ 提交更改..."
git commit -m "$COMMIT_MSG" || {
    echo "⚠️  没有需要提交的变化"
    exit 0
}
echo "✓ 提交完成"
echo ""

# 推送
echo "⏳ 推送到 GitHub..."
git push origin "$CURRENT_BRANCH"

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "  ✅ 推送成功！"
    echo "=========================================="
    echo ""
    echo "📬 您的报告将在 1-2 分钟后可访问："
    echo ""
    
    for file in "${NEW_FILES[@]}" "${MODIFIED_FILES[@]}"; do
        filename=$(basename "$file")
        echo "   https://${GITHUB_USER}.github.io/${REPO_NAME}/${filename}"
    done
    
    echo ""
    echo "📋 所有报告列表："
    echo "   https://${GITHUB_USER}.github.io/${REPO_NAME}/"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "  ❌ 推送失败"
    echo "=========================================="
    echo ""
    echo "请检查："
    echo "1. SSH key 是否已添加到 GitHub"
    echo "2. 网络连接是否正常"
    echo "3. 仓库权限是否正确"
    echo ""
    exit 1
fi
