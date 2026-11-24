---
name: searxng-mcp
description: "Use when SearXNG MCPで調べ物をする。エンジン指定の罠と精度手順。"
license: MIT
metadata:
  hermes:
    tags: [searxng, mcp, search, research, engines]
    related_skills: [crawl4ai-mcp, grounded-citations]
---

# SearXNG MCP（検索の一次窓口）

トリガー: 調査 / 検索 / web検索 / 論文検索 / 一次情報 / エンジン指定 / 検索精度。
SKIP when: 取得先URLが既に確定していて本文だけ欲しい（→ `crawl4ai-mcp`）。

自前インスタンス経由の検索。**以下の数値・挙動は 2026-10-15 に実インスタンスで実測したもの**。
インスタンス: MCP `http://<HOMELAB_HOST>:8000/mcp` → SearXNG本体 `http://<HOMELAB_HOST>:8888`（version 2026.11.2+cccbc9e15、有効エンジン96/261、2026-11-04時点）。

> `<HOMELAB_HOST>` は自宅サーバのアドレス（公開リポジトリのため伏せている）。実際の値は各クライアントの MCP 設定（Claude: `~/.claude.json`、Codex: `~/.codex/config.toml`）の URL を見る。

## When to Use

- 調べ物を始めるとき（URLが未確定の段階）
- 特定のDB・論文サーバ・コードホストを狙って引くとき（`engines` 指定）
- 情報源の質を評価しながら複数ソースを突き合わせるとき
- 時事・ニュースの鮮度を揃えたいとき（`time_range`）

## 1. 使うツール

| ツール | 用途 |
|--------|------|
| `mcp__searxng__search` | 唯一の検索ツール。これだけ |
| `mcp__searxng__list_resources` / `list_prompts` | 実測で両方**空**。使わない |

### 引数の実測された意味

| 引数 | 実測挙動 |
|------|----------|
| `query` | 必須。SearXNGの検索構文（バング・`:lang`）がそのまま効く |
| `max_results` | 返却件数。**サーバ側で20が上限**（50指定→20件） |
| `engines` | **エンジン名**のカンマ区切り（`pubmed`, `github`, `arxiv`, `google cse` のように空白込みの正式名）|
| `categories` | `general`/`science`/`it`/`news`/`images`/`files` 等 |
| `language` | `ja`, `en`, `en-US`。日本語調査では `ja` を必ず指定 |
| `time_range` | `day`/`week`/`month`/`year`（実測で `week` 動作） |
| `pageno` | ページ番号。重複なし |
| `timeout_limit` | 全体の待ち時間の上限（秒） |
| `detail` | `full` にすると各結果に `engine` が付く。**調査では常に full** |
| `fresh` | 短期キャッシュを回避 |

返り値JSON: `count`（返却件数）/ `found`（エンジンが申告した総ヒット数）/ `results[]` / `snippets_truncated` / `unresponsive_engines`。

## 2. 実測で判明した落とし穴（本スキルの核心）

1. **`engines` と `categories` を併用すると絞り込まれない。** `engines="pubmed"` + `categories="science"` で openalex と crossref が返り、pubmed 自体は返らなかった（found も105に膨張）。→ **どちらか片方だけ指定**。
2. **`engines` はフルネームのみ。バング略号は無効。** `engines="gh"` は黙って無視され、既定エンジン（bing/yandex…）の結果が返った。`engines="github"` なら github エンジンの結果だけが返る。
3. **未知のエンジン名はエラーにならず黙って無視される。** → 必ず `detail="full"` で結果の `engine` を見て、狙ったエンジンが実際に効いたか確認する。
4. **バングはクエリ側に書く。** `!arx scaling laws`, `!pub CRISPR off-target`, `!gh actions cache` は有効（指定エンジンのみが答える）。チェーン・言語プレフィックス（`:ja`）も可。
5. **`site:` 演算子は下位エンジン依存で当てにならない。** `site:github.com …` を bing に投げても weblio や qiita が混ざった。ドメイン限定は `engines=github` 等を使う。
6. **`unresponsive_engines` を必ず見る。** `mwmbl: timeout` が常態化、`wikipedia: HTTP error`、`crossref: unexpected crash`、`reuters: HTTP error` も実測。落ちたエンジンの欠落は結果の偏りになる。
7. **スニペットは切り詰められる**（`snippets_truncated`）。断定的な引用・数値・式は必ず `crawl4ai-mcp` で本文を取る。
8. **`pageno` を深く掘ると話題から外れる。** arxiv で pageno=2 を引くと無関係な論文が混ざった。深追いはページ送りではなく**クエリ語かエンジンを変える**。
9. **general 検索の中身が偏っている。** 2026-11-04 に brave / yahoo / wiby / naver を有効化し、一般系は bing / brave / yandex / mwmbl / wikipedia / wikidata / google cse / yahoo / wiby / naver になった。`google cse` は共有CX（blackle.com）由来で `unusual traffic` の429を常時返す＝実質死んでいる。`google` は access denied。**精度の実質的な担い手は bing と brave**。naver は language_support 無効で日本語/英語クエリに韓国語ノイズを混ぜる点に注意。
10. **上流で `inactive: true` のエンジンは設定から有効化できない。** mojeek は Altcha PoW CAPTCHA 必須のため上流が inactive 指定。設定に `disabled: false` を書いても /config に現れず、**`engines=mojeek` は未知エンジン扱いで既定エンジンにフォールバックし、それらしい件数が返る**（実測：全エンジン検索と同じ件数になった）。有効化を検証するときは `/config` に名前が出たか、`detail=full` で `engine` が狙った名前かまで確認する。
11. **組み込み `web_search` は信用しすぎない。** 実測で backend（openai-native）が失敗し keyless free tier に rescue され、結果の出自（どのインデックスか）が不明になった。`web_extract` は「search-only backend」で**本文抽出に使えない**。本文は `crawl4ai-mcp` で取る。
12. **`safesearch` はスパム除去に効かない。** `safesearch=0/1/2` で同一クエリの結果が1件も変わらなかった（`search.safe_search: 1` 設定も無効）。yandex が返すスパム（google.com / missav / twivideo 等）は安全検索ではなく**エンジン側の応答劣化**。対策は「`detail="full"` で `engine` を見て yandex 由来の下位を捨てる」か「`engines=` で yandex を外す」。

## 3. 目的別エンジン早見表（有効92エンジンから抜粋）

| 調査の種類 | 指定 |
|-----------|------|
| 医学・生命科学の一次文献 | `pubmed`, `europepmc`, `openairepublications`, `pdbe` |
| プレプリント | `arxiv`, `openalex`, `semantic scholar`, `openairedatasets` |
| 学術横断・DOI | `crossref`, `openalex`, `google scholar`（time_range対応）|
| 実装・コード | `github`, `stackoverflow`, `mdn`, `npm`, `pypi`, `docker hub`, `microsoft learn` |
| モデル・データセット | `huggingface`, `huggingface datasets` |
| 脆弱性 | `national vulnerability database` |
| ニュース・時事 | `bing news`, `google news`, `duckduckgo news`, `brave.news`, `reuters`（不安定）|
| 日本語の一般情報 | `language="ja"`（実質 bing / brave）|
| 辞書・語源・翻訳 | `wiktionary`, `etymonline`, `lingva`, `dictzone` |
| 地図・天気 | `openstreetmap`, `photon`, `wttr.in` |

有効エンジン全92件（カテゴリ・バング・paging/time_range/language対応の別）は `references/enabled-engines.md`。

## 4. 精度を上げる調査手順

1. **質問を1目的に分解し、目的ごとに1検索。** 広い語でまとめて引くと遅く、かつ薄い結果になる。
2. **`detail="full"` を常に付ける。** 出典エンジンを記録できるかどうかが、報告時の情報源評価の前提になる。
3. **独立2エンジン以上で裏を取る。** 例: `pubmed` と `europepmc`、`arxiv` と `semantic scholar`、`github` と `mdn`。1〜2ソースしか無いときは「未確認」と明示する。
4. **反証検索を1本入れる。** 否定形・別表記・「limitation」「contradiction」「未再現」で引き直し、反例を確認する。
5. **本文まで取る。** 数値・実験条件・主張はスニペットで済ませず `mcp__crawl4ai__md` で一次ページを読む。
6. **`unresponsive_engines` と `snippets_truncated` を報告に反映。** 欠測・切り詰めは精度評価の情報。
7. **プロモーション・SEO記事を区別。** 一般系で上位に来ただけの記事は一次ソースではない。ベンダ公式・一次論文・政府/学会を優先する。

## 5. トラブルシューティング

| 症状 | 対策 |
|------|------|
| 結果が薄い | `pageno=2` より先にクエリ語を具体化、または `engines` を絞る |
| 狙ったエンジンが効いていない | `engines` にショートカット（!gh）を書いていないか、`categories` と併用していないか確認 |
| 遅い | `timeout_limit` を下げる / 不安定エンジン（mwmbl 等）を `engines` から外す |
| 情報が古い | `time_range` を指定（news系エンジンが対応）|
| 同じ結果ばかり | `fresh=true` でキャッシュ回避 |
| 日本語結果が出ない | `language="ja"` を明示（既定言語は未設定）|

## 6. 関連

- 本文抽出・JS描画ページ・スクショ/PDF: `crawl4ai-mcp`
- 出典の質の判定と引用の作法: `grounded-citations`, `documenting-with-sources`
