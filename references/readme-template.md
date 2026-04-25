# README Template

Use this structure when writing or rewriting a public README. Fill every section with real content — no placeholders. Omit sections that genuinely don't apply rather than leaving them empty.

The README has one job: a developer should read it and know immediately whether this tool is for them, and if so, be able to run it in five minutes.

---

## Template

```markdown
```
[figlet -f rectangles output of the project display name goes here, inside a code block]
```

# [Tool Name]

> [One sentence: what it does and who it's for. Be specific. "A CLI that watches a directory and auto-commits changes to git" beats "A useful developer tool."]

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

\`\`\`bash
# Install
pip install [package] # or: git clone ..., npm install, etc.

# Configure
cp env.example .env
# edit .env with your values

# Run
python main.py --help
\`\`\`

## Usage

[The most common real use case, fully shown. Use realistic values, not `<your-value-here>`.]

\`\`\`bash
[example command with real-looking output or explanation]
\`\`\`

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
```

---

## Notes on Tone

**The Problem and Why I Built This sections are the most important.**
They're what make a stranger decide whether to keep reading. Write them like a developer talking to a developer — specific, honest, and direct. Avoid marketing language, vague claims about productivity, and anything that sounds like it came from a product brief.

**Limitations are not a weakness.** Listing them honestly makes the project look more trustworthy, not less. Every tool has scope. State it.

**Quick Start must work.** Before publishing, run the Quick Start commands on a clean machine or in a clean shell. If they don't work, fix them or fix the setup — don't fudge the docs.

**Visuals should clarify, not decorate.** A repo map, architecture diagram, or generated illustration is useful when it helps a stranger understand the shape of the project. Keep it project-bound under `assets/` or `docs/assets/`, give it meaningful alt text, insert it into the README where it supports the surrounding explanation, and avoid private screenshots or decorative images that do not explain anything.
