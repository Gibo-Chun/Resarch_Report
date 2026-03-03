# GitHub Pages 部署指南

## 🎯 目标
将 HTML 报告发布到 GitHub，通过 GitHub Pages 实现在线访问。

## 📋 前置条件

### 1. 创建 GitHub 仓库（如尚未创建）

访问：https://github.com/new

- **Repository name**: `Resarch_Report`（或您喜欢的名称）
- **Description**: 个人研究报告归档
- **Public** 或 **Private**（根据您的偏好）
- **不要** 初始化 README、.gitignore 或 license（保持空仓库）
- 点击 **Create repository**

### 2. 选择认证方式（二选一）

---

## 方式 A：使用 SSH Key（推荐，一次配置永久使用）

### 步骤 1：检查 SSH Key 是否已添加到 GitHub

```bash
cat ~/.ssh/id_rsa.pub
```

复制输出的内容。

### 步骤 2：添加到 GitHub

1. 访问：https://github.com/settings/keys
2. 点击 **New SSH key**
3. **Title**: 任意名称（如 "My Laptop"）
4. **Key type**: Authentication Key
5. **Key**: 粘贴刚才复制的内容
6. 点击 **Add SSH key**

### 步骤 3：测试连接

```bash
ssh -T git@github.com
```

看到 "Hi Gibo-Chun! You've successfully authenticated" 表示成功。

### 步骤 4：推送报告

```bash
cd /home/admin1/.openclaw/workspace

# 添加 README 和推送脚本
git add README.md push_to_github.sh iphone_vs_domestic_price_report.html

# 提交
git commit -m "Initial commit: Add research reports and deployment scripts"

# 配置 SSH 远程仓库
git remote remove origin 2>/dev/null
git remote add origin git@github.com:Gibo-Chun/Resarch_Report.git

# 首次推送（需要确认主机密钥）
git push -u origin master
```

首次连接时会提示确认 GitHub 主机密钥，输入 `yes` 即可。

---

## 方式 B：使用 Personal Access Token（无需配置 SSH）

### 步骤 1：生成 Token

1. 访问：https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. **Note**: 填写描述（如 "Research Report Upload"）
4. **Expiration**: 选择过期时间（建议 No expiration 或 90 天）
5. **Select scopes**: 勾选 **`repo`** (Full control of private repositories)
6. 点击 **Generate token**
7. **立即复制 Token**（只显示一次！）

### 步骤 2：推送报告

```bash
cd /home/admin1/.openclaw/workspace

# 添加文件
git add README.md push_to_github.sh iphone_vs_domestic_price_report.html

# 提交
git commit -m "Initial commit: Add research reports and deployment scripts"

# 配置 HTTPS 远程仓库（将 YOUR_TOKEN 替换为您的实际 Token）
git remote remove origin 2>/dev/null
git remote add origin https://Gibo-Chun:YOUR_TOKEN@github.com/Gibo-Chun/Resarch_Report.git

# 推送
git push -u origin master
```

### 或者使用推送脚本

```bash
cd /home/admin1/.openclaw/workspace
./push_to_github.sh
```

按提示输入 Token 即可。

---

## 🌐 启用 GitHub Pages

推送成功后，启用 GitHub Pages：

1. 访问仓库设置：https://github.com/Gibo-Chun/Resarch_Report/settings/pages
2. **Source** 选择：`Deploy from a branch`
3. **Branch** 选择：`master` 或 `main`，目录选择 `/ (root)`
4. 点击 **Save**

等待 1-2 分钟，Pages 将自动部署。

---

## 📬 访问您的报告

启用后，报告可通过以下地址访问：

- **首页**: `https://Gibo-Chun.github.io/Resarch_Report/`
- **iPhone 17e 报告**: `https://Gibo-Chun.github.io/Resarch_Report/iphone_vs_domestic_price_report.html`
- **其他报告**: `https://Gibo-Chun.github.io/Resarch_Report/<文件名>.html`

---

## 🔄 后续添加新报告

每次生成新报告后，只需运行：

```bash
cd /home/admin1/.openclaw/workspace

# 添加新报告
git add <新报告文件名>.html

# 提交并推送
git commit -m "Add: <报告名称>"
git push
```

或使用自动脚本：
```bash
./push_to_github.sh
```

---

## ⚠️ 常见问题

### 1. 推送失败：权限被拒绝

- SSH 方式：确认 SSH key 已添加到 GitHub
- Token 方式：确认 Token 有效且有 `repo` 权限

### 2. GitHub Pages 显示 404

- 等待 1-2 分钟让 Pages 部署
- 确认 Pages 设置中选择了正确的分支（master/main）
- 确认仓库是 Public（Private 仓库需要 GitHub Pro）

### 3. 仓库名称拼写错误

您提到的仓库名是 `Resarch_Report`，注意这是 "Research" 的拼写错误。如需更正：
- 在 GitHub 仓库设置中更改仓库名
- 然后更新本地远程仓库 URL

---

## 📞 需要帮助？

运行以下命令检查状态：
```bash
cd /home/admin1/.openclaw/workspace
git remote -v
git status
```
