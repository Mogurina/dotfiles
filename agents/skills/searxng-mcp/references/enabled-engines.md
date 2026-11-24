# 有効エンジン一覧（実測 2026-10-15）

- インスタンス: `http://<HOMELAB_HOST>:8888` / version 2026.10.13+22c64b8d3
- 登録 261 エンジン中 **有効 92**（この一覧は有効分のみ）
- `engines=` に渡すのは **name 列の正式名**（`gh` のようなショートカットは無効、バング `!gh` はクエリ側で有効）
- tr = time_range 対応 / lang = language 指定対応 / pg = paging 対応
- 再生成: `curl -s http://<HOMELAB_HOST>:8888/config -o cfg.json` → `engines[].enabled` で絞る

## cargo

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `crates.io` | !crates | Y | - | - |

## currency

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `currency` | !cc | - | - | - |

## define

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `wordnik` | !wnik | - | - | - |

## dictionaries

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `etymonline` | !et | Y | - | - |
| `wiktionary` | !wt | Y | - | - |
| `wordnik` | !wnik | - | - | - |

## files

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bt4g` | !bt4g | Y | Y | - |
| `kickass` | !kc | Y | - | - |
| `piratebay` | !tpb | - | - | - |
| `solidtorrents` | !solid | Y | - | - |
| `wikicommons.files` | !wcf | Y | - | - |

## general

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bing` | !bi | - | - | Y |
| `currency` | !cc | - | - | - |
| `dictzone` | !dc | - | - | - |
| `google cse` | !goc | Y | Y | Y |
| `lingva` | !lv | - | - | - |
| `mwmbl` | !mwm | - | - | - |
| `mymemory translated` | !tl | - | - | - |
| `wikidata` | !wd | - | - | Y |
| `wikipedia` | !wp | - | - | Y |
| `yandex` | !yd | Y | Y | - |

## images

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bing images` | !bii | Y | Y | Y |
| `brave.images` | !brimg | - | - | Y |
| `duckduckgo images` | !ddi | Y | - | Y |
| `google cse images` | !goci | Y | Y | Y |
| `pinterest` | !pin | Y | - | - |
| `wikicommons.images` | !wci | Y | - | - |

## it

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `arch linux wiki` | !al | Y | - | Y |
| `askubuntu` | !ubuntu | Y | - | - |
| `crates.io` | !crates | Y | - | - |
| `docker hub` | !dh | Y | - | - |
| `gentoo` | !ge | Y | - | - |
| `github` | !gh | - | - | - |
| `hackernews` | !hn | Y | Y | - |
| `hoogle` | !ho | - | - | - |
| `huggingface` | !hf | - | - | - |
| `huggingface datasets` | !hfd | - | - | - |
| `mankier` | !man | - | - | - |
| `mdn` | !mdn | Y | - | - |
| `microsoft learn` | !msl | Y | - | - |
| `national vulnerability database` | !nvd | Y | - | - |
| `npm` | !npm | Y | - | - |
| `pkg.go.dev` | !pgo | - | - | - |
| `pypi` | !pypi | - | - | - |
| `stackoverflow` | !st | Y | - | - |
| `superuser` | !su | Y | - | - |

## lyrics

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `genius` | !gen | Y | - | - |

## map

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `openstreetmap` | !osm | - | - | - |
| `photon` | !ph | - | - | - |

## music

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bandcamp` | !bc | Y | - | - |
| `genius` | !gen | Y | - | - |
| `mixcloud` | !mc | Y | - | - |
| `radio browser` | !rb | Y | - | Y |
| `soundcloud` | !sc | Y | - | - |
| `wikicommons.audio` | !wca | Y | - | - |
| `youtube` | !yt | Y | Y | - |

## news

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bing news` | !bin | Y | Y | Y |
| `brave.news` | !brnews | - | - | Y |
| `duckduckgo news` | !ddn | Y | - | Y |
| `google news` | !gon | Y | - | Y |
| `reuters` | !reu | Y | Y | - |
| `wikinews` | !wn | Y | - | - |

## other

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `1x` | !1x | - | - | - |
| `500px` | !500 | Y | - | - |
| `chefkoch` | !chef | Y | - | - |
| `etymonline` | !et | Y | - | - |
| `pexels` | !pe | Y | Y | - |
| `picjumbo` | !pj | Y | - | - |
| `shopify stock` | !shs | Y | - | - |
| `stocksnap` | !sto | Y | - | - |
| `unsplash` | !us | Y | - | - |
| `wiktionary` | !wt | Y | - | - |
| `wordnik` | !wnik | - | - | - |
| `wttr.in` | !wttr | - | - | - |

## packages

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `crates.io` | !crates | Y | - | - |
| `docker hub` | !dh | Y | - | - |
| `hoogle` | !ho | - | - | - |
| `npm` | !npm | Y | - | - |
| `pkg.go.dev` | !pgo | - | - | - |
| `pypi` | !pypi | - | - | - |

## q&a

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `askubuntu` | !ubuntu | Y | - | - |
| `stackoverflow` | !st | Y | - | - |
| `superuser` | !su | Y | - | - |

## radio

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `radio browser` | !rb | Y | - | Y |

## repos

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `github` | !gh | - | - | - |
| `huggingface` | !hf | - | - | - |
| `huggingface datasets` | !hfd | - | - | - |

## science

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `arxiv` | !arx | Y | - | - |
| `crossref` | !cr | Y | - | - |
| `europepmc` | !epmc | Y | - | - |
| `google scholar` | !gos | Y | Y | Y |
| `openairedatasets` | !oad | Y | - | - |
| `openairepublications` | !oap | Y | - | - |
| `openalex` | !oa | Y | - | - |
| `pdbe` | !pdb | - | - | - |
| `pubmed` | !pub | - | - | - |
| `semantic scholar` | !se | Y | - | - |

## scientific publications

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `arxiv` | !arx | Y | - | - |
| `crossref` | !cr | Y | - | - |
| `europepmc` | !epmc | Y | - | - |
| `google scholar` | !gos | Y | Y | Y |
| `openalex` | !oa | Y | - | - |
| `pubmed` | !pub | - | - | - |
| `semantic scholar` | !se | Y | - | - |

## social media

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `lemmy comments` | !lecom | Y | - | - |
| `lemmy communities` | !leco | Y | - | - |
| `lemmy posts` | !lepo | Y | - | - |
| `lemmy users` | !leus | Y | - | - |
| `mastodon hashtags` | !mah | - | - | - |
| `mastodon users` | !mau | - | - | - |
| `tootfinder` | !toot | - | - | - |

## software wikis

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `arch linux wiki` | !al | Y | - | Y |
| `gentoo` | !ge | Y | - | - |

## stock images

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `1x` | !1x | - | - | - |
| `500px` | !500 | Y | - | - |
| `pexels` | !pe | Y | Y | - |
| `picjumbo` | !pj | Y | - | - |
| `shopify stock` | !shs | Y | - | - |
| `stocksnap` | !sto | Y | - | - |
| `unsplash` | !us | Y | - | - |

## translate

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `dictzone` | !dc | - | - | - |
| `lingva` | !lv | - | - | - |
| `mymemory translated` | !tl | - | - | - |

## videos

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bing videos` | !biv | Y | Y | Y |
| `brave.videos` | !brvid | - | - | Y |
| `dailymotion` | !dm | Y | Y | Y |
| `duckduckgo videos` | !ddv | Y | - | Y |
| `google videos` | !gov | Y | Y | Y |
| `sepiasearch` | !sep | Y | Y | Y |
| `vimeo` | !vm | Y | - | - |
| `wikicommons.videos` | !wcv | Y | - | - |
| `youtube` | !yt | Y | Y | - |

## weather

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `wttr.in` | !wttr | - | - | - |

## web

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `bing` | !bi | - | - | Y |
| `bing images` | !bii | Y | Y | Y |
| `bing videos` | !biv | Y | Y | Y |
| `brave.images` | !brimg | - | - | Y |
| `brave.videos` | !brvid | - | - | Y |
| `google cse` | !goc | Y | Y | Y |
| `google cse images` | !goci | Y | Y | Y |
| `google videos` | !gov | Y | Y | Y |

## wikimedia

| name | bang | pg | tr | lang |
|---|---|---|---|---|
| `wikinews` | !wn | Y | - | - |
| `wiktionary` | !wt | Y | - | - |
