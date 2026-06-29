# README Template

Use this structure when writing or rewriting a public README. Fill every section with real content — no placeholders. Omit sections that genuinely don't apply rather than leaving them empty.

The README has one job: a developer should read it and know immediately whether this tool is for them, and if so, be able to run it in five minutes.

---

## Canonical Section Order

One fixed order. Required sections appear in every README. Optional sections
appear only when they apply, always in this position. Never reorder.

**Required:**
1. ASCII figlet banner (`rectangles` font, fenced)
2. `# Title` (display name, not repo slug)
3. `> One-line tagline` (specific: what it does, who it is for)
4. Badge row (install, license; optional version/status)
5. `## The Problem`
6. `## Why I Built This` (fold the one-sentence build-in-public origin note in here)
7. `## What It Does`
8. `## Quick Start` (fastest path to first value: install+run for tools, read+apply for guides)
9. `## Requirements`
10. `## Limitations`
11. `## License`

**Optional (in this fixed position when included):**
- Visual anchor OR before→after example block — after the badge row, before The Problem
- File-map table — after What It Does
- `## How It Works` — after the file-map table, only if the approach is non-obvious
- `## Usage` — after Quick Start
- `## Configuration` — after Usage, only if env/config exists
- `## Credits` / `## Contributing` — after License

---

## Formatting Toolkit

- **GitHub callouts.** Hard cap: at most two per README. Reserve for a real gotcha
  or a single must-know constraint (`> [!WARNING]`, `> [!IMPORTANT]`). `[!NOTE]`
  and `[!TIP]` are easiest to overuse; default to prose for those. If a third
  callout feels necessary, restructure the section instead. Callout-everywhere is
  slop.
- **File-map table.** Two columns, `| File | What it is |`, linked file paths in
  the first column. Standard headers, standard shape.
- **`<details>` collapsibles.** Wrap long tail sections (extended credits,
  exhaustive config, long file lists). The `<summary>` line describes what is
  inside. Never hide primary content.
- **Structured lists over prose.** Convert how-to and usage sections to tight
  bolded-lead lists or definition blocks. Use tables for anything key/value
  shaped.

---

## Visuals

Prose and content repos (guides, rule sets, writing) get a before→after example
block that shows the product working. Reserve generated diagrams for repos with
genuine structure to map. Mechanics for generating and placing any image live in
[`narrative-voice.md`](narrative-voice.md) (see "README Visuals").

Before→after example block format:

> **Before**
> ```
> [the unprocessed input]
> ```
> **After**
> ```
> [what the tool produces]
> ```

---

## Notes on Tone

Voice is defined once, in [`narrative-voice.md`](narrative-voice.md). Write every
section to that standard. README-structure-specific reminders:

- The Problem and Why I Built This carry the most weight. A stranger decides
  whether to keep reading there.
- Quick Start must work from a clean clone. Run it before publishing.
- Limitations build trust. State the scope honestly.
- Visuals clarify, they do not decorate.

---

## Template

````markdown
```
[figlet -f rectangles output of the project display name goes here, inside a code block]
```

# [Tool Name]

> [One sentence: what it does and who it's for. Be specific. "A CLI that watches a directory and auto-commits changes to git" beats "A useful developer tool."]

<!-- Badge row: left-aligned, max 3, static shields.io. Fill <owner>/<repo>, <LICENSE>, <version>. -->
[![install](https://img.shields.io/badge/install-npx%20skills%20add-000000)](https://github.com/<owner>/<repo>)
[![license](https://img.shields.io/badge/license-<LICENSE>-blue)](LICENSE)
[![version](https://img.shields.io/badge/version-<version>-green)](#)

[Optional: include a repo map, architecture diagram, or generated dark-mode visual here if it helps a cold reader understand the project faster. Store generated assets under `assets/` or `docs/assets/` and reference them with relative paths. Put repo-wide visuals here near the top; put feature-specific visuals in the section they explain. Keep exact technical details in Markdown, Mermaid, SVG, or prose if a generated image could blur or distort labels.]

## The Problem

[2–4 sentences. Name the specific frustration — not the category, the moment.
The reader should think "yes, I've had that exact problem."

Example: "Every time I resumed a project after a few days away, I'd spend 20 minutes figuring out which environment variables were missing on this machine. The .env file was always stale. The README hadn't been updated. I'd broken prod twice because of this, so I fixed it."]

## Why I Built This

[The thesis. What design decision follows from that frustration? What does the approach say about the problem?

This is not "what it does" — it's the argument for *how* it does it and why that matters.

Good questions to answer here:
- Why didn't existing tools solve this?
- What's the key insight or constraint that shaped the design?
- What's interesting or non-obvious about the approach?

Example: "Most tools in this space try to be full secret managers. That's the wrong abstraction for most projects — it's too much ceremony. The insight here is simpler: the contract between a project and its environment should be explicit and version-controlled, but the values themselves don't have to be. One schema file, zero server dependencies."]

[One sentence of build-in-public context if relevant — keep it brief:
"Built during a weekend exploration, cleaned up and published because it solved a real problem."]

## What It Does

[What goes in, what comes out. Describe the behavior, not the implementation.
Use a short example or sample output if it helps.

Example:
- Reads `.env.schema` — a manifest of every variable your project needs
- Compares it against your actual environment
- Reports missing or undocumented variables
- Optionally bootstraps `.env.local` from the schema with prompts for values]

## How It Works

[Optional. Include only if there's something technically interesting or non-obvious about the approach.
Skip this section if the implementation is straightforward.

Example: "Uses a single-pass diff against the running environment rather than file comparison, so it catches variables set outside any dotfile."]

## Quick Start

[The minimal path from zero to running. Copy-pasteable commands. Works on a clean machine.]

```bash
# Install
pip install [package] # or: git clone ..., npm install, etc.

# Configure
cp env.example .env
# edit .env with your values

# Run
python main.py --help
```

## Usage

[The most common real use case, fully shown. Use realistic values, not `<your-value-here>`.]

```bash
[example command with real-looking output or explanation]
```

[Add a second example if there's a meaningfully different mode or flag worth showing.]

## Configuration

[If env vars or config files are required, document every key:]

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `API_KEY` | yes | — | Your API key from [source] |
| `OUTPUT_DIR` | no | `./output` | Where results are written |

[Or prose if a table is overkill.]

## Requirements

- [Language and minimum version: e.g., Python 3.10+]
- [System dependencies if any: e.g., ffmpeg, git]
- [External accounts or API keys if needed]

## Limitations

[Be honest about rough edges. This section builds trust.]

- [e.g., "Only tested on macOS and Linux. Windows paths may need adjustment."]
- [e.g., "Processes files sequentially — not optimized for large batches."]
- [e.g., "Requires manual setup for repos with non-standard branch names."]

## License

MIT
````
