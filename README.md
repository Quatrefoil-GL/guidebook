## Phlox Calcit Guide Book

### 迁移说明

文档内容、目录顺序和原有 mdbook 页面保留。前端改用 Calcit / `@calcit/procs`
0.30.0、Node.js 24、Yarn 4.18.0，以及正式版本的 Docs Workflow / Respo / Reel。
源码只维护 `calcit.cirru` 和 `deps.cirru`，不再使用 `compact.cirru`。

文档节点与应用状态使用 Docs Workflow 的 `DocNode` / `Store`，浏览器事件在入口
转换为正式 `Op`；非法状态数据会明确报错，不通过强转绕过类型检查。

纯 updater 不再声明 JS FFI 权限；状态树解码明确要求 Tag 键的 Map，避免以
宽泛 Map 类型掩盖状态结构。此改动不改变文档内容、目录顺序或部署路径。

**目前暂不部署**：完整 `calcit fix --workflow strict --verify` 仍受正式依赖
Docs Workflow 0.0.35 的 `next-path` 回调证明错误阻塞。普通检查、构建成功不代表
该门禁通过；必须等待正式依赖修复后复跑，不使用未发布模块替代。

最新的独立候选栈回放已清除上述 Docs Workflow 阻塞，并修正本应用自身的
renderer 入口：开放 action 先检查 Enum，再调用原 typed dispatch，不改变
文档路径、状态或事件 payload。该副本覆盖了待发版 Docs Workflow/Reel，
完整 strict 通过，但不是正式 root 验收；实际依赖锁仍保留正式版本，
发布链完成前不推送 PR、不合并或部署。

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
