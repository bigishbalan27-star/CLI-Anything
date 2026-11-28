---
name: cli-anything-alexa
description: >-
  Control the user's Amazon Echo / Alexa devices with cli-anything-alexa: speak or announce on an Echo, run any voice command as text, routines, music, volume, smart-home lights, and the morning briefing. Use whenever the user wants Alexa, an Echo, "the Dot", an announcement, or a spoken briefing.
---

# cli-anything-alexa

Command-line control of a user's Amazon Echo devices through Amazon's Alexa
web API (via alexapy). Every command supports `--json`.

## Installation

On the user's Mac (cloud sessions cannot reach Amazon or the user's login):

```bash
python3 -m pip install --upgrade --force-reinstall --no-deps "git+https://github.com/bigishbalan27-star/CLI-Anything.git#subdirectory=alexa/agent-harness"
```

From a checkout of this repo: `pip install -e alexa/agent-harness`.

## This user's setup

- Account is on **amazon.co.uk**: always sign in with `--domain amazon.co.uk` (locale en-GB is set automatically).
- Default device: **"Echo Dot"** (Bigish's Echo Dot). "Bigish" alone is ambiguous (Dot and Echo Show); use "Echo Dot" or "Show".
- Multi-room speaker group: music/volume only.
- Port 8765 is taken by PhoneBox on the Mac; never pass `--port 8765` (the default picks a free port).
- In a cloud session, do not run Alexa commands here; give the user the exact commands to run on the Mac.

## Morning briefing

`alexa/agent-harness/examples/morning_briefing.sh ["Echo Dot"] ["Bigish"]` speaks a dated greeting, then weather, today's calendar and the Flash Briefing. To schedule on the Mac (Mac must be awake):

```bash
(crontab -l 2>/dev/null; echo "30 7 * * * /path/to/morning_briefing.sh 'Echo Dot' Bigish >> $HOME/alexa-briefing.log 2>&1") | crontab -
```

## First-time setup (the user must do this)

```bash
cli-anything-alexa auth login --email you@example.com [--domain amazon.co.uk]
```

It opens a local page that proxies Amazon's real sign-in. Never ask the user
for their Amazon password in chat; they type it into Amazon's page.

Check the session before acting:

```bash
cli-anything-alexa --json auth status
```

`{"logged_in": false}` means ask the user to run `auth login`.

## Agent workflow

1. `cli-anything-alexa --json device list` to learn exact device names.
2. Act on one device by name (case-insensitive, unique partial names work).
3. Read the JSON result. `"ok": true, "sent": true` means Amazon accepted it.
4. On `"ok": false`, use `error` to self-correct:
   - `not_logged_in`: ask the user to run `auth login`.
   - `device_not_found` / `ambiguous_device`: the message lists valid names; retry with one.
   - `invalid_input`: fix the argument (text empty or over 1000 chars, bad provider...).

Use `--dry-run` to validate a command without touching any device.

## Command reference

| Goal | Command |
|---|---|
| List speakers | `device list` (`--all` includes apps/groups, `--cached` skips Amazon) |
| Device details | `device info <device>` |
| Speak on one Echo | `speak <device> "<text>"` |
| Announce (chime) | `announce "<text>" [-d <device> ...] [--title T]` (default: all online Echos) |
| Any voice command | `command <device> "<what you'd say to Alexa>"` |
| Built-in feature | `sequence <device> weather\|traffic\|flash-briefing\|good-morning\|good-night\|joke\|fun-fact\|sing\|story\|clean-up\|calendar-today\|calendar-tomorrow\|calendar-next` |
| Routines | `routine list`, `routine run <device> "<trigger phrase>"` |
| Music | `music play <device> "<query>" [--provider amazon\|spotify\|apple\|tunein\|iheart\|pandora\|deezer] [--timer SECONDS]` |
| Playback | `music pause\|resume\|next\|previous\|stop <device>` |
| Volume | `volume <device> <0-100>` |
| Smart home | `smarthome list`, `smarthome light <entity_id> --on/--off [--brightness N] [--color NAME]` |
| Account | `auth status [--verify]`, `auth locale <en-US\|en-GB\|de-DE...>`, `auth logout` |

## Examples

```bash
cli-anything-alexa --json device list
cli-anything-alexa --json speak "Kitchen" "Your build finished successfully"
cli-anything-alexa --json announce "Dinner is ready"
cli-anything-alexa --json command "Kitchen" "turn off the living room lights"
cli-anything-alexa --json command "Bedroom" "set an alarm for 7 am"
cli-anything-alexa --json routine run "Kitchen" "good night"
cli-anything-alexa --json music play "Living Room" "jazz for work" --provider spotify --timer 1800
cli-anything-alexa --json volume "Kitchen" 25
```

## Notes for agents

- `command` is the most general tool: anything the user could say to Alexa
  (timers, alarms, shopping list, smart-home devices, questions) works as text.
  The Echo replies out loud, not in the JSON.
- Prefer `announce` for messages to the household; it chimes first and can
  target several rooms.
- Echo speech and smart-home changes are real-world actions in someone's home.
  Confirm with the user before announcing to all devices, playing loud audio,
  or acting at night.
- This is an unofficial API. If a command reports success but nothing
  happens, suggest `pip install -U alexapy` and `auth login` again.
