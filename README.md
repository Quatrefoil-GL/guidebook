## Phlox Calcit Guide Book

### 迁移说明

文档内容、目录顺序和原有 mdbook 页面保留。前端改用 Calcit / `@calcit/procs`
0.30.0、Node.js 24、Yarn 4.18.0，以及正式版本的 Docs Workflow / Respo / Reel。
源码只维护 `calcit.cirru` 和 `deps.cirru`，不再使用 `compact.cirru`。

文档节点与应用状态使用 Docs Workflow 的 `DocNode` / `Store`，浏览器事件在入口
转换为正式 `Op`；非法状态数据会明确报错，不通过强转绕过类型检查。

纯 updater 不再声明 JS FFI 权限；状态树解码明确要求 Tag 键的 Map，避免以
宽泛 Map 类型掩盖状态结构。此改动不改变文档内容、目录顺序或部署路径。

正式依赖已协调为 Docs Workflow 0.0.36、Reel 0.6.38、Markdown 0.4.55、
UI 0.7.40、Alerts 0.10.54、Router 0.8.35、Respo 0.16.120、js-ffi 0.2.3。
本地根项目完整 strict/preflight 零诊断，238 个定义检查、JS/Vite CDN 构建及
原 mdbook/linkcheck 构建通过；本地只读源码链接不代替 PR CI 的 fresh Caps 验收。
renderer 入口的开放 action 先检查 Enum，再进入原 typed dispatch，不改变
文档路径、状态或事件 payload。实际 Guide → Materials → Geometries → Box
及历史回访通过，无 JS error；现有 get-env mode 警告保留。原项目没有附带测试，
不以构建或浏览器导航宣称所有行为均有自动化覆盖，仍需审查及 CI 后才能合并部署。

Vite 使用 `preserveSymlinks` 保留 Caps 模块入口路径，让原模块 CSS 直接解析
消费者 npm 依赖和图片；不复制模块样式、不扩大开发服务器文件访问范围，也不在
模块目录补装 node_modules。此分发问题已反馈上游
[Docs Workflow #90](https://github.com/calcit-lang/docs-workflow/issues/90)。

```bash
corepack enable
caps --strict
yarn install --immutable
calcit js
yarn vite
```

CI 为前端配置 COS CDN，仅使用上传 action 自带的公开 checksum 校验，不额外添加
验证脚本。PR 资源使用独立前缀，不部署生产服务器；主分支仍部署至原
`/web-assets/repo/Quatrefoil-GL/guidebook`，mdbook 输出与 `mdbook.html` 路径不变。
需配置 `COS_BUCKET`、`COS_SECRET_ID`、`COS_SECRET_KEY` 和原 `rsync_private_key`。

### mdbook

```bash
cargo install mdbook
cargo install mdbook-linkcheck

mdbook serve
```

### License

MIT
