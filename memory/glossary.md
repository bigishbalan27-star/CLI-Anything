# Glossary

Shorthand used with this fork. Hot subset lives in `CLAUDE.md`.

## Terms
| Term | Meaning | Context |
|------|---------|---------|
| the fork | github.com/bigishbalan27-star/CLI-Anything | `origin` remote; `upstream` = HKUDS/CLI-Anything |
| the PR | HKUDS/CLI-Anything#649 | Alexa harness; branch `feat/alexa-harness` |
| CLI-Anything | HKUDS project that wraps apps as agent-friendly CLIs | each app = `<app>/agent-harness/` |
| CLI-Hub | `cli-hub` installer for those CLIs | reads only the upstream registry |
| harness | one CLI-Anything tool package | `cli_anything/<app>/`, SKILL.md, tests |
| graphify / the graph | code knowledge graph in `graphify-out/` | `graphify query "..."` before grepping |
| alexapy | Python library behind the Alexa harness | also used by Home Assistant's Alexa Media Player |
| Codex bot | `chatgpt-codex-connector` review bot on the PR | reviews every push; findings verified before fixing |
| Check Root Skills | upstream CI job | waits for maintainer approval on fork PRs |
| briefing | morning Alexa briefing | `alexa/agent-harness/examples/morning_briefing.sh` |

## Devices (Alexa)
| Nickname | Device name to use | Notes |
|----------|--------------------|-------|
| the Dot | `"Echo Dot"` | Bigish's Echo Dot; default target |
| the Show | `"Show"` | Bigish's Echo Show 5 (3rd Gen) |
| the group | multi-room speaker group | music/volume only, not speak/announce |
| household Echo | another member's Echo | works via owner customer ID (tested) |
"Bigish" alone is ambiguous (Dot and Show) — always use a unique part of the name.
