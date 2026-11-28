# Alexa harness (`cli-anything-alexa`)

**Also called:** the Alexa tool, the Alexa CLI, the PR
**Status:** Working and live-tested on the user's Mac with real Echos (amazon.co.uk). Upstream PR HKUDS/CLI-Anything#649 open, awaiting maintainer review.

## Where
- Code: `alexa/agent-harness/` (on `main` and `feat/alexa-harness`)
- Skill: `skills/cli-anything-alexa/SKILL.md` (repo mirror) and `.claude/skills/cli-anything-alexa/` (loaded by Claude Code sessions in this repo)
- Tests: `alexa/agent-harness/cli_anything/alexa/tests/` — 116 pass, 5 live tests opt-in (`ALEXA_E2E=1`)

## Install / use (on the Mac, not the cloud session)
```bash
python3 -m pip install --upgrade --force-reinstall --no-deps "git+https://github.com/bigishbalan27-star/CLI-Anything.git#subdirectory=alexa/agent-harness"
cli-anything-alexa auth login --email <amazon email> --domain amazon.co.uk
cli-anything-alexa device list
cli-anything-alexa speak "Echo Dot" "Hello"
```
Cloud sessions cannot reach Amazon (network policy) and have no Amazon login; run real commands on the Mac.

## Lessons from the live test
- Port 8765 is used by the PhoneBox app on the Mac → login now picks a free port; never pass `--port 8765`.
- python.org Python on macOS lacked CA certs → tool now uses certifi; fallback is "Install Certificates.command".
- Account is on amazon.co.uk → always `--domain amazon.co.uk` (locale en-GB set automatically).
- Device names: "Bigish" matches two devices; use "Echo Dot" / "Show".
- Alexa phone apps ("This Device", family VOX) are hidden; WHA groups only for music/volume.

## Review history
Codex bot reviewed 9+ rounds; all valid findings fixed. Not changed (verified against alexapy 1.36 and 1.38): `play_music` accepts `timer`; `run_routine` resolves names; AlexaAPI needs no owner ID on the device object.

## Morning briefing
`examples/morning_briefing.sh` speaks a greeting + weather + today's calendar + flash briefing. Schedule with cron on the Mac (Mac must be awake), e.g. `30 7 * * *`.
