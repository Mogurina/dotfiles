---
name: crawl4ai-mcp
description: "Use when 本文抽出・JS描画ページを読む。crawl4ai MCPの使い方。"
license: MIT
metadata:
  hermes:
    tags: [crawl4ai, mcp, scraping, markdown, screenshot, pdf]
    related_skills: [searxng-mcp, blocked-page-recovery]
---

# Crawl4AI MCP（本文抽出）

トリガー: クロール / スクレイピング / 本文取得 / JSレンダリング / スクリーンショット / PDF化。
SKIP when: URLが未確定（→ `searxng-mcp` で検索してからここ）。

環境: リモートサーバ `http://<HOMELAB_HOST>:11235`（**version 0.9.5**、実測 2026-10-15）へ SSE + Bearer で接続。ローカルインストールではない。

> `<HOMELAB_HOST>` は自宅サーバのアドレス（公開リポジトリのため伏せている）。実際の値は各クライアントの MCP 設定（Claude: `~/.claude.json`、Codex: `~/.codex/config.toml`）の URL を見る。

## 使えるツール（実測）

| ツール | 用途 | 主な引数 |
|--------|------|----------|
| `mcp__crawl4ai__md` | 1ページをMarkdown化。**最頻用** | `url`, `f`(fit/raw/bm25/llm), `q`(bm25/llm用), `provider`/`temperature`(llm用), `c`(キャッシュバスト) |
| `mcp__crawl4ai__crawl` | 複数URL一括 | `urls`(最大100), `crawler_config`, `crawler_configs`(URL毎設定) |
| `mcp__crawl4ai__screenshot` | 全ページPNG | `url`, `screenshot_wait_for`(既定2秒), `wait_for_images` |
| `mcp__crawl4ai__html` | スキーマ抽出用に整形したHTML | `url` |
| `mcp__crawl4ai__pdf` | PDF化（Chromium印刷） | `url` |
| `mcp__crawl4ai__ask` | Crawl4AIライブラリ自体の質問 | スキーマに引数は無いが `query`/`context_type`/`max_results` を渡すと効く（実測）|
| `execute_js` / `crawl` の `hooks` | **このサーバでは無効（403）** | 環境変数が未設定。代替を使う |
| `list_resources` / `read_resource` | 両方空 | 使わない |

## フィルタ（`f=`）の選び方

- `fit`（既定）: Readability系（PruningContentFilterLXML）。ニュース・記事・ブログはこれで十分。
- `raw`: DOM→Markdown丸ごと。表・付録・リストを取り落としたくないとき。
- `bm25` + `q="..."`: クエリに近いチャンクだけ残す。長いドキュメントから必要箇所を抜く。
- `llm` + `q="..."`: LLM要約。**要約なので数値・式の引用元にはしない**。

⚠ 0.9.0 以降 `output_path` は無視される（引数は残っているが何も書かれない）。

## 返り値の形

- `md`: `{"url","filter","query","cache","markdown","success"}` — 本文は `markdown`。
- `crawl`: URLごとに `html` / `cleaned_html` / `markdown.raw_markdown` / `links` / `media` / `metadata` / `status_code` を含む巨大JSON。**`markdown.fit_markdown` は既定で空**（content filter未設定）→ `raw_markdown` を見る。
- `screenshot` / `pdf`: `{"success","screenshot"|"pdf":"<base64>","artifact_id","url":"/artifacts/<id>","mime","size"}`。**base64が同梱**され、`/artifacts/<id>` は Bearer 必須（認証なしは401）＝curlで取り直すよりbase64をデコードする。
- 50KB超のレスポンスは spillover ファイル（`…\hermes\cache\spillover\call_*.txt`）に退避される。

### 画像/PDFを成果物にするレシピ（動作確認済み）

```python
import json, base64, os
p = os.path.expandvars(r"%LOCALAPPDATA%\hermes\cache\spillover\call_xxx.txt")  # 結果に表示されたパス
d = json.loads(open(p, encoding="utf-8", errors="replace").read())
out = os.path.join(os.environ["TMPDIR"], "shot.png")
open(out, "wb").write(base64.b64decode(d["screenshot"]))   # PDFなら d["pdf"]
print("MEDIA:" + out)   # PNGは \x89PNG / PDFは %PDF で健全性確認
```

## 使い分け

1. URLが未確定 → `mcp__searxng__search`（`searxng-mcp`）
2. 1ページの本文 → `mcp__crawl4ai__md`
3. 複数ソースの一括取得 → `mcp__crawl4ai__crawl`（出力が巨大なので数件ずつ）
4. 表・付録まで正確に → `f="raw"`
5. 巨大ドキュメントの該当箇所 → `f="bm25", q="..."`
6. 画像証跡・アーカイブ → `screenshot` / `pdf`
7. SPA・動的ページ → サーバ側が Playwright で描画するので `md` のままでよい。**`execute_js` は無効なので代替にしない**（取れなければ `f="raw"` → ブラウザツール）

## 注意

- このスキルは全プロファイル共有（`shared-skills/`）。`searxng` MCP（`searxng-mcp` スキル）は default プロファイルにしか設定されていないので、無いプロファイルでは検索を組み込み `web_search` で代替し、本文抽出はこの MCP を使う。
- リモートサーバで動いている。手元での `curl + Python` の手書きスクレイピングはしない。
- `ask` はCrawl4AI自体の仕様確認専用。**ページ内容の取得には使わない**。
- Bearer トークンは各クライアントの設定（Claude: `~/.claude.json`, Codex: `~/.codex/config.toml`）に直書きされている。更新したらそのクライアントを再起動。
- config.yaml は生の書き換えをしない（壊れると全ツールが死ぬ）。

## トラブルシューティング

| 症状 | 原因 | 対策 |
|------|------|------|
| ツールが一覧に無い | 未接続 / トークン切れ | config.yaml の Authorization 確認 → Hermes再起動 |
| 401 | Bearer が無効 | トークン再発行（サーバ管理者）|
| 404 "Could not find session" | SSEセッション切れ | そのまま再試行（自動再接続）|
| 403 execute_js / hooks | サーバ側で機能無効 | 使わない（上記の代替）|
| 他クライアント(Codex/Claude Code)で「Dynamic Client Registration rejected (HTTP 401)」 | `/mcp/sse` はlegacy SSE専用（`/mcp` は404）。HTTPクライアントは繋げない | stdioブリッジ経由にする: `npx -y mcp-remote http://<HOMELAB_HOST>:11235/mcp/sse --allow-http --transport sse-only --header "Authorization: Bearer <TOKEN>"`（`--allow-http`と`--transport sse-only`は必須）|
| 空のMarkdown | JS描画前 / fit が削りすぎ | `f="raw"` を試す |
| 出力が大きすぎて読めない | spillover 退避 | 退避ファイルを read_file / execute_code で部分的に読む |
