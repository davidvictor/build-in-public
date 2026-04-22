```
 _           _ _     _   _                     _     _ _      
| |__  _   _(_) | __| | (_)_ __    _ __  _   _| |__ | (_) ___ 
| '_ \| | | | | |/ _` | | | '_ \  | '_ \| | | | '_ \| | |/ __|
| |_) | |_| | | | (_| | | | | | | | |_) | |_| | |_) | | | (__ 
|_.__/ \__,_|_|_|\__,_| |_|_| |_| | .__/ \__,_|_.__/|_|_|\___|
                                  |_|                         
```

# build-in-public

> A cross-platform agent skill that takes a working local repo and handles the entire "make it public" pass — secrets audit, README narrative, zip packaging, and GitHub publish — in one command. Works with Claude Code and Codex.

## The Problem

Good tools die on the machine they were built on. The gap between "this works" and "someone else can clone and run this" is wider than it looks: secrets mixed into history, a README that assumes too much, no install path a stranger can follow, no license. Most prototypes never close that gap — not because the tool isn't worth sharing, but because the closing is tedious and easy to defer indefinitely.

## Why I Built This

One command should close that gap. This skill treats the whole process as a single workflow: audit for secrets and private paths, harden the install steps, write the README with the right narrative structure, package a clean zip from committed HEAD, and push to GitHub with description and topics set.

The non-obvious design decision: most release tools handle the mechanics and skip the narrative. This one has an opinion about narrative. The `references/readme-template.md` encodes a specific structure — problem, thesis, what it does, quick start, limitations — because a README without a clear "why it exists" section is a stub that nobody reads past the first paragraph. The skill asks for "the spark" (what made you build this?) as a preflight step, uses your answer as a lens, then reads the code itself to find what's actually interesting.

Built as a personal skill, published because it solved a real problem.

## What It Does

Given a local repo that already works, the skill:

1. **Audits** for secrets, private paths, local credentials, and history that shouldn't be public
2. **Hardens** install steps, `.gitignore`, `env.example`, and the primary entrypoint
3. **Writes** a README following a narrative template — problem, thesis, what it does, quick start, limitations
4. **Packages** a clean release zip using `git archive` (committed files only, no working tree debris)
5. **Publishes** a public GitHub repo with a prepared description and topic tags

## How It Works

The skill is a single `SKILL.md` definition that works in any agent runtime supporting the `SKILL.md` frontmatter convention (Claude Code, Codex, oh-my-claudecode, and similar). The agent reads the code deeply enough to form three hypotheses about why it was built, then asks you to confirm the framing. That answer informs the README narrative, but the code is the primary source — the agent finds what's technically interesting regardless of how you describe the motivation.

The release strategy distinguishes between two lanes: harden in place when the existing repo and git history are safe to expose, or create a clean public-export repo when the working project is good but the history has scratch commits, private notes, or experimental debris. The skill defaults to the safer lane.

## Quick Start

### Recommended: install via `npx skills`

The easiest path is the cross-agent [`skills` CLI](https://github.com/vercel-labs/skills). It auto-detects your installed agents and copies the skill into the right place:

```bash
npx skills add davidvictor/build-in-public
```

That's it. Works for Claude Code, Codex, Cursor, OpenCode, and 40+ other agent runtimes. To install globally (to `~/.claude/skills/` or `~/.codex/skills/`) without prompts:

```bash
npx -y skills add davidvictor/build-in-public -g -y
```

To preview what would be installed without touching your filesystem:

```bash
npx skills add davidvictor/build-in-public --list
```

### Updating

To refresh installed skills to the latest version:

```bash
npx skills update
```

Or re-run `npx skills add davidvictor/build-in-public` — the CLI re-clones from `main` and overwrites.

### Manual install (if you prefer)

<details>
<summary>Claude Code</summary>

```bash
git clone https://github.com/davidvictor/build-in-public ~/.claude/skills/build-in-public
```
</details>

<details>
<summary>Codex</summary>

```bash
git clone https://github.com/davidvictor/build-in-public ~/.codex/skills/build-in-public
```
</details>

<details>
<summary>Both agents via symlink</summary>

```bash
git clone https://github.com/davidvictor/build-in-public ~/skills/build-in-public
ln -s ~/skills/build-in-public ~/.claude/skills/build-in-public
ln -s ~/skills/build-in-public ~/.codex/skills/build-in-public
```
</details>

### Invoking

Once installed, run against any repo you want to publish:

```
build in public
```

Or, in runtimes that support slash commands (oh-my-claudecode, etc.):

```
/build-in-public
```

## Usage

Point the agent at any local repo that already solves a real problem. The skill will:

1. Read the code and form hypotheses about the motivation
2. Ask you to confirm "the spark" (one of three proposed options, or your own phrasing)
3. Run the full audit → harden → docs → package → publish pass
4. Report the GitHub URL when done

The skill also works on repos outside the default codex workspace — point it at any local path and it adapts.

## Included Files

| File | Purpose |
|------|---------|
| `SKILL.md` | The skill definition — loaded by Claude Code and Codex |
| `references/public-release-checklist.md` | Gate checklist used before publishing |
| `references/readme-template.md` | README structure template used when writing docs |
| `scripts/create_release_zip.sh` | Packages a clean zip from committed HEAD |

## Compatibility Notes

The `SKILL.md` frontmatter includes `allowed-tools` and `version` fields. Claude Code uses `allowed-tools` to scope which tools the skill can invoke; Codex currently ignores unknown frontmatter fields. Both agents parse the rest of the frontmatter identically.

If you maintain your own fork and want a stricter Codex-minimal definition, you can safely remove the `allowed-tools` and `version` fields — the skill body does not depend on them.

## Requirements

- An agent runtime supporting `SKILL.md` (Claude Code, Codex, or compatible)
- `gh` CLI for the publish step (with `gh auth login` configured)
- `figlet` for the ASCII banner (`brew install figlet` on macOS)
- `git` and `unzip` for the packaging step

## Limitations

- Tested on macOS. The shell scripts should work on Linux; Windows paths are not handled.
- The publish step uses `gh` CLI — requires `gh auth login` to be configured first.
- The skill is opinionated about README structure. If your project needs a different format, edit `references/readme-template.md` after cloning.
- History rewriting is explicitly out of scope — the skill prefers a clean public-export repo over `git filter-branch` surgery.
- `figlet` must be installed for the ASCII banner step; the skill degrades gracefully if it's missing.

## License

MIT
