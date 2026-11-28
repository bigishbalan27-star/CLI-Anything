## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- When graphify-out/graph.json exists, run `graphify query "<question>"` before your first grep, search or source-file read for a codebase question, and put this rule in every subagent prompt that explores code. Read raw files only for lines the graph or an earlier read already located. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. When the answer is under a Markdown heading, `graphify section "<heading>"` prints that section's text, so the .md need not be opened. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
- A committed graphify-out/graph.json is rewritten whole on every build, so a large diff to it in a pull request is expected. Do not flag it as churn or suggest skipping the graph rebuild or its hooks.

## Memory

Hot cache for this fork. Full detail: `memory/` (glossary, projects, context).

### Me
**Bigish** (GitHub `bigishbalan27-star`). Uses this fork of HKUDS/CLI-Anything to give AI agents CLI tools; tests on a Mac (Python 3.13 from python.org), Amazon account on **amazon.co.uk**.

### Terms
| Term | Meaning |
|------|---------|
| **the fork** | github.com/bigishbalan27-star/CLI-Anything (origin; HKUDS repo is `upstream`) |
| **the PR** | HKUDS/CLI-Anything#649, Alexa harness, branch `feat/alexa-harness` |
| **CLI-Hub** | `cli-hub` package manager for CLI-Anything tools (`pip install cli-anything-hub`) |
| **harness** | a CLI-Anything tool folder: `<app>/agent-harness/` |
| **the Dot** | "Bigish's Echo Dot" (target as `"Echo Dot"`) |
| **briefing** | morning Alexa briefing script, `alexa/agent-harness/examples/morning_briefing.sh` |
→ Full glossary: memory/glossary.md

### Projects
| Name | What |
|------|------|
| **Alexa harness** | `cli-anything-alexa`, controls Echo devices; built here, live-tested on the Mac → memory/projects/alexa-harness.md |
| **Graph** | graphify knowledge graph of this repo in `graphify-out/` (see graphify section above) |
| **Cloud setup** | Default environment installs graphify, CLI-Hub (+pip, Pillow), GIMP, LibreOffice → memory/context/setup.md |

### Preferences
- Wants things set up once and ready in every session; push work to the fork's `main`.
- Upstream PRs go from a clean branch off `upstream/main` (no graph files), commits `feat:`/`fix:`/`docs:`.
- Daily PR auto-fix checks were stopped at the user's request; check the PR only when asked ("check pr").
- Never store email, device serials or account IDs in this public repo.
