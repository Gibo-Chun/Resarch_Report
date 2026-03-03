# 🚀 快速部署指南（3 分钟完成）

## 当前状态
✅ 报告已生成：`iphone_vs_domestic_price_report.html`  
✅ Git 仓库已配置  
⏳ 待完成：GitHub 认证和推送

---

## 第一步：在 GitHub 创建仓库（1 分钟）

1. 访问：**https://github.com/new**
2. 填写：
   - **Repository name**: `Resarch_Report`
   - **Description**: 个人研究报告归档
   - **Public**: ✅（Public 才能免费使用 GitHub Pages）
3. 点击 **Create repository**

---

## 第二步：添加 SSH Key 到 GitHub（1 分钟）

1. 复制您的 SSH 公钥：
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```
   输出类似：`ssh-rsa AAAA... 您的密钥`

2. 访问：**https://github.com/settings/keys**

3. 点击 **New SSH key**
   - **Title**: `My Laptop`
   - **Key type**: Authentication Key
   - **Key**: 粘贴刚才复制的内容

4. 点击 **Add SSH key**

---

## 第三步：推送报告（1 分钟）

复制并运行以下命令：

```bash
cd /home/admin1/.openclaw/workspace

# 配置远程仓库
git remote remove origin 2>/dev/null
git remote add origin git@github.com:Gibo-Chun/Resarch_Report.git

# 推送所有文件
git push -u origin master
```

---

## 第四步：启用 GitHub Pages（30 秒）

1. 访问：**https://github.com/Gibo-Chun/Resarch_Report/settings/pages**

2. 设置：
   - **Source**: Deploy from a branch
   - **Branch**: master → `/ (root)`
   - 点击 **Save**

3. 等待 1-2 分钟部署完成

---

## 🎉 完成！访问您的报告

```
https://Gibo-Chun.github.io/Resarch_Report/
https://Gibo-Chun.github.io/Resarch_Report/iphone_vs_domestic_price_report.html
```

---

## 📌 后续添加新报告

```bash
cd /home/admin1/.openclaw/workspace
git add <新报告>.html
git commit -m "Add: 新报告名称"
git push
```

---

## ⚠️ 如果遇到问题

### 问题 1: Permission denied (publickey)
→ 确认 SSH key 已正确添加到 GitHub

### 问题 2: Repository not found
→ 确认仓库已创建，且名称拼写正确（`Resarch_Report`）

### 问题 3: GitHub Pages 404
→ 等待 2 分钟，或检查 Pages 设置是否正确

---

## 🔐 替代方案：使用 Token（如果 SSH 有问题）

1. 生成 Token: https://github.com/settings/tokens/new
   - Note: `Research Report Upload`
   - Scopes: 勾选 `repo`
   - 点击 Generate，**复制 Token**

2. 使用 Token 推送：
```bash
cd /home/admin1/.openclaw/workspace
git remote remove origin 2>/dev/null
git remote add origin https://Gibo-Chun:YOUR_TOKEN_HERE@github.com/Gibo-Chun/Resarch_Report.git
git push -u origin master
```
（将 `YOUR_TOKEN_HERE` 替换为您的实际 Token）
