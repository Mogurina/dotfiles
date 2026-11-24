# agents

複数の AI コーディングツールで共通の指示とスキルを使うための置き場所（2026-11-24 作成）。
`~/.agents` はこのディレクトリへのシンボリックリンク。

| パス | 役割 |
|---|---|
| `soul.md` | 共通の指示の正本 |
| `skills/` | Claude Code と Codex で共有する自作スキル |

## 各ツールの入口

| ツール | 入口 | 方式 |
|---|---|---|
| Claude Code | `~/.claude/CLAUDE.md` | `soul.md` へのシンボリックリンク |
| Codex | `~/.codex/AGENTS.md` | `soul.md` へのシンボリックリンク |
| Antigravity（WSL） | `~/.gemini/GEMINI.md` | `soul.md` へのシンボリックリンク |
| スキル | `~/.claude/skills/<名前>`、`~/.codex/skills/<名前>` | `skills/<名前>` へのシンボリックリンク |

## 新しい環境でのセットアップ

```bash
ln -s ~/tools/dotfiles/agents ~/.agents
ln -s ~/.agents/soul.md ~/.claude/CLAUDE.md
ln -s ~/.agents/soul.md ~/.codex/AGENTS.md
ln -s ~/.agents/soul.md ~/.gemini/GEMINI.md
for t in .claude .codex; do
  for s in ~/.agents/skills/*/; do ln -s "${s%/}" ~/$t/skills/; done
done
```

## 直すとき

- `soul.md` やスキルを直せば、すべてのツールにすぐ反映される。

## 公開リポジトリなので書かないもの

- トークン・パスワード（MCP の Bearer トークンは `~/.claude.json` / `~/.codex/config.toml` にだけ書く）
- 自宅サーバのアドレス。スキルでは `<HOMELAB_HOST>` と書き、実際の値は各クライアントの MCP 設定を見る

## 共有されないもの

- 各ツールの自動メモリ・会話履歴（Claude の `~/.claude/projects/*/memory/` など）
- MCP サーバーの設定（ツールごとの設定ファイルに登録する）
- `backup-*/`（統合前のファイル。`.gitignore` で除外）
