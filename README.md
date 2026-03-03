# Research Report - 研究报告集

个人研究报告归档，通过 GitHub Pages 在线访问。

## 📊 可用报告

| 报告名称 | 发布日期 | 在线访问 |
|---------|---------|---------|
| iPhone 17e vs 国产手机定价分析报告 | 2026-03-03 | [查看报告](./iphone_vs_domestic_price_report.html) |
| Zaixi Zhang Research Report | - | [查看报告](./Zaixi_Zhang_Research_Report.html) |
| LLM Interpretability Protein Biology Presentation | - | [查看报告](./LLM_Interpretability_Protein_Biology_Presentation.html) |

## 🌐 在线访问

启用 GitHub Pages 后，所有报告可通过以下地址访问：

```
https://Gibo-Chun.github.io/Resarch_Report/
```

## 📤 添加新报告

### 方式一：使用自动推送脚本（推荐）

```bash
cd /home/admin1/.openclaw/workspace
./push_to_github.sh
```

按提示输入 GitHub Personal Access Token 即可完成推送。

### 方式二：手动推送

```bash
cd /home/admin1/.openclaw/workspace

# 添加新报告
git add <报告文件名>.html

# 提交
git commit -m "Add: <报告名称>"

# 推送
git push origin master
```

## 🔧 GitHub Pages 设置

1. 访问仓库设置：https://github.com/Gibo-Chun/Resarch_Report/settings/pages
2. **Source** 选择：`Deploy from a branch`
3. **Branch** 选择：`master` / `/ (root)`
4. 点击 **Save**

启用后约 1-2 分钟，报告即可在线访问。

## 📁 文件结构

```
Resarch_Report/
├── README.md              # 本说明文件
├── *.html                 # HTML 格式研究报告
├── push_to_github.sh      # 自动推送脚本
└── ...                    # 其他报告相关文件
```

## 📝 报告格式规范

- 所有报告使用 **HTML 格式**，支持内联 CSS/JS
- 文件名格式：`YYYY-MM-DD_报告主题.html` 或 `报告主题.html`
- 确保 HTML 文件为完整文档（包含 `<!DOCTYPE html>`）

---

**最后更新**: 2026-03-03
