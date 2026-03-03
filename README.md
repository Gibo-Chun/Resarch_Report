# Research Report - 研究报告集

个人研究报告归档，通过 GitHub Pages 在线访问。

## 🌐 在线访问

**首页**: https://Gibo-Chun.github.io/Resarch_Report/

## 📊 可用报告

| 报告名称 | 发布日期 | 在线访问 |
|---------|---------|---------|
| iPhone 17e vs 国产手机定价分析报告 | 2026-03-03 | [查看](./iphone_vs_domestic_price_report.html) |
| LLM 可解释性 - 蛋白质生物学应用 | 2026-03-02 | [查看](./LLM_Interpretability_Protein_Biology_Presentation.html) |
| 张载熙 (Zaixi Zhang) 研究汇报 | 2026-02-28 | [查看](./Zaixi_Zhang_Research_Report.html) |

## 🤖 自动化部署

### 一键部署（推荐）

```bash
cd /home/admin1/.openclaw/workspace
./auto_deploy_reports.sh
```

**脚本功能：**
1. ✅ 自动扫描所有 HTML 报告文件
2. ✅ 自动提取报告标题、日期、分类
3. ✅ 自动生成/更新 `index.html`（包含所有报告链接和更新日期）
4. ✅ 自动提交并推送到 GitHub
5. ✅ 新报告自动标记 "NEW" 徽章（7 天内）

### 部署后访问

```
📋 首页：https://Gibo-Chun.github.io/Resarch_Report/
📄 报告：https://Gibo-Chun.github.io/Resarch_Report/<报告文件名>.html
```

## 📁 文件结构

```
Resarch_Report/
├── README.md                    # 本说明文件
├── index.html                   # 自动生成的报告索引首页
├── auto_deploy_reports.sh       # 自动部署脚本 v2.0
├── *.html                       # HTML 格式研究报告
└── ...                          # 其他文件
```

## 📝 报告格式规范

### 推荐 HTML 元数据（便于自动提取）

在 HTML 文件的 `<head>` 中添加：

```html
<title>报告标题</title>
<meta name="description" content="报告描述">
<!-- 日期格式：报告生成时间：2026-03-03 -->
```

### 文件名格式

推荐：`YYYY-MM-DD_报告主题.html` 或 `报告主题.html`

## 🔧 GitHub Pages 设置

1. 访问：https://github.com/Gibo-Chun/Resarch_Report/settings/pages
2. **Source**: Deploy from a branch
3. **Branch**: master / `/ (root)`
4. 点击 **Save**

启用后约 1-2 分钟，报告即可在线访问。

## 📈 自动化特性

| 功能 | 状态 | 说明 |
|------|------|------|
| 自动扫描 HTML 文件 | ✅ | 自动检测工作目录下所有.html 文件 |
| 自动提取标题 | ✅ | 从`<title>` 标签提取 |
| 自动提取日期 | ✅ | 优先从 HTML 内容提取，否则使用文件修改日期 |
| 自动分类 | ✅ | 根据标题关键词自动分类（市场研究/生物科技/学术研究） |
| 自动生成首页 | ✅ | 生成美观的 index.html，包含所有报告链接 |
| 新报告标记 | ✅ | 7 天内的报告自动添加"NEW"徽章 |
| 自动推送 | ✅ | 自动 git add/commit/push |

## 🔄 工作流程

```
生成新报告.html
      ↓
运行 ./auto_deploy_reports.sh
      ↓
脚本自动：
  1. 扫描所有 HTML 文件
  2. 提取元数据（标题/日期/分类）
  3. 更新 index.html
  4. Git 提交并推送
      ↓
GitHub Pages 自动部署（1-2 分钟）
      ↓
在线可访问！🎉
```

## ⚠️ 注意事项

- **不要手动编辑 `index.html`** - 它由脚本自动生成
- 确保所有报告文件为有效的 HTML 格式
- 首次运行需确保 SSH key 已添加到 GitHub

## 📞 故障排除

### 推送失败
```bash
# 检查 SSH 连接
ssh -T git@github.com

# 检查远程仓库配置
git remote -v
```

### 报告未显示在首页
- 确保 HTML 文件在 workspace 根目录
- 确保文件名以 `.html` 结尾
- 重新运行 `./auto_deploy_reports.sh`

---

**最后更新**: 2026-03-03  
**自动化脚本版本**: v2.0
