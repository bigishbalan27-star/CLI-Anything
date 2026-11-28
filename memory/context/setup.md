# Environment and setup

## Cloud sessions (Claude Code on the web, Default environment)
Setup script installs on every fresh session:
- `graphify` (graphifyy) + git hooks for this repo (graph auto-rebuilds after commits/checkouts)
- `cli-hub` with pip and Pillow; GIMP + `cli-anything-gimp`; LibreOffice + `cli-anything-libreoffice`
- `cli-anything-alexa` from this checkout (`uv tool install ./CLI-Anything/alexa/agent-harness`); not logged in, Amazon unreachable, so cloud use is dry-run/planning only
- Also (added by the user): ECC and claudex-loop Claude plugins, Codex CLI
Network allowlist includes `hkuds.github.io` and `clianything.cc` (CLI-Hub registry). Amazon is NOT reachable from the cloud.

## Repo layout notes
- Root `.gitignore` ignores everything at top level; new top-level paths need a `!/name/` line.
- `.claude/settings.json` holds graphify PreToolUse hooks; `.claude/skills/` holds project skills; `.claude/agents/alexa.md` is the Alexa subagent.
- Root skill mirror is generated: edit `<app>/agent-harness/cli_anything/<app>/skills/SKILL.md`, then run `python3 .github/scripts/sync_root_skills.py`.

## The user's Mac
- macOS, Python 3.13 (python.org), `cli-anything-alexa` at `/Library/Frameworks/Python.framework/Versions/3.13/bin/cli-anything-alexa`
- PhoneBox app occupies port 8765.
- No machine is attached to cloud sessions by default; give the user commands to run.
