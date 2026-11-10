## Quatrefoil Calcit Guide Book

### Calcit 0.40.0 升级

开发使用配对的 Calcit CLI 和 `@calcit/procs` 0.40.0。文档导航通过具名 `docs-workflow.schema/Op` 派发。Reel 0.11 的面板和快捷键使用独立的 `reel.typed/Control` 回调，由 Docs Workflow 0.1.0 的组件接收。

### Calcit 0.32.1 迁移记录

本轮文档站配对正式 Calcit CLI / `@calcit/procs` **0.32.1**、Node.js 24、Yarn 4.18.0。
严格 Caps 从已发布 tag 安装八个模块：Docs Workflow 0.0.40、Respo 0.17.1、Reel 0.7.0-alpha.5、
Markdown 0.5.0-alpha.5、UI 0.9.0、Router 0.9.0-alpha.4、Alerts 0.11.0-alpha.4、JS-FFI 0.2.9。
直接声明与 Docs Workflow 实际固定版本一致，不用本地候选或忽略冲突；仍有 alpha 依赖，
不宣称整张图均为稳定版。
升级后重装依赖并刷新，UI 样式可能有差异。保留文档目录、mdbook 页面；源码只维护
`calcit.cirru` 和 `deps.cirru`，不再使用 `compact.cirru`。

默认 entry 显式绑定 `dispatch-op :dynamic`，对应原 renderer 的受检 `Dynamic → Unit` 合同。
原 Enum 检查与 payload 解码保持，类型门禁不放宽。一小时 npm 依赖等待期无按版本豁免。

本轮完整 241 个定义、13 个公开定义、完整 strict、canonical、不可变安装、工具链配对和
Vite/mdBook 构建通过。官方规范化前后 13 个完整定义视图一致；原项目没有附带测试，不新增空测试。
实际 SPA 的 Materials → Geometries → Box、快速跳转 Ambient Light、Escape 关闭及刷新回 Guide
通过，SPA 无警告或错误。原 mdbook.html 入口及 Box 深层链接通过；mdBook 的 Cirru 代码块
因缺少语言注册而回退纯文本并报警，已汇报 [#14](https://github.com/Quatrefoil-GL/guidebook/issues/14)。
不将该已知限制写成 mdBook 高亮已通过；未操作剪贴板、真实存档或外部应用。

文档节点与应用状态使用 Docs Workflow 的 `DocNode` / `Store`，浏览器事件在入口
转换为正式 `Op`；非法状态数据会明确报错，不通过强转绕过类型检查。

纯 updater 不再声明 JS FFI 权限；状态树解码明确要求 Tag 键的 Map，避免以
宽泛 Map 类型掩盖状态结构。此改动不改变文档内容、目录顺序或部署路径。

历史 0.30.1 依赖曾协调为 Docs Workflow 0.0.37、Reel 0.6.41、Markdown 0.4.59、
UI 0.8.0、Alerts 0.10.57、Router 0.8.37、Respo 0.16.124、js-ffi 0.2.5。
此前 0.30.0 根项目完整 strict/preflight 零诊断，238 个定义检查、JS/Vite CDN 构建及
原 mdbook/linkcheck 构建通过；本地只读源码链接不代替 PR CI 的 fresh Caps 验收。
renderer 入口的开放 action 先检查 Enum，再进入原 typed dispatch，不改变
文档路径、状态或事件 payload。实际 Guide → Materials → Geometries → Box
及历史回访通过，无 JS error；现有 get-env mode 警告保留。原项目没有附带测试，
不以构建或浏览器导航宣称所有行为均有自动化覆盖。这些历史结果不是新图的验收；
本次正式 CI 与实际浏览器证据记录在迁移 PR，审查和生产部署另行决定。

本次保留现有公开 Option 用法、真实 Op 解码、Enum 渲染入口和 Tag 键 Map 检查，
不机械改写已有正确代码，不弱化类型，也不以 raise 替换 `hud!` 页面错误/成功提示。
文档节点、60 秒 Map 存档写入和原本禁用恢复的行为不变。

Vite 使用 `preserveSymlinks` 保留 Caps 模块入口路径，让原模块 CSS 直接解析
消费者 npm 依赖和图片；不复制模块样式、不扩大开发服务器文件访问范围，也不在
模块目录补装 node_modules。此分发问题已反馈上游
[Docs Workflow #90](https://github.com/calcit-lang/docs-workflow/issues/90)。

```bash
corepack enable
caps --strict --ci
yarn install --immutable
caps verify --toolchain
calcit js
yarn vite
```

CI 为前端配置 COS CDN，仅使用上传 action 自带的公开 checksum 校验，不额外添加
验证脚本。SPA 与 mdBook 都在构建成功后上传校验，PR 留存原始双前端短期预览。
PR 资源使用独立前缀，不部署生产服务器；主分支仍部署至原
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
