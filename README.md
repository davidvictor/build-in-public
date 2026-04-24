```
 _       _ _   _    _                _   _ _     
| |_ _ _|_| |_| |  |_|___    ___ _ _| |_| |_|___ 
| . | | | | | . |  | |   |  | . | | | . | | |  _|
|___|___|_|_|___|  |_|_|_|  |  _|___|___|_|_|___|
                            |_|                  
```

# build-in-public

> A skill for turning a working local repo into a public-ready project: audit risk, tighten setup, write clearer docs, package a clean archive, and publish to GitHub when appropriate.

## About

`build-in-public` closes the gap between "this works on my machine" and "someone else can clone, understand, and run it." It is for small tools, prototypes, and lab repos that already solve a real problem but still need the final public-release pass: secret checks, reproducible setup, README structure, packaging, and publish metadata.

The workflow is intentionally practical. It favors clear docs, honest constraints, and safe release lanes over heavy process. When the current repo and history are safe, it hardens in place; when they contain private context or messy scratch work, it prepares a clean public export.

The README pass is part of the product. The included `references/readme-template.md` keeps the story focused on the problem, purpose, quick start, and limitations so the result is useful to a cold reader, not just the person who built it.

## What It Does

Given a local repo that already works, the skill:

1. **Audits** for secrets, private paths, local credentials, and history that shouldn't be public
2. **Hardens** install steps, `.gitignore`, `env.example`, and the primary entrypoint
3. **Writes** a README following a practical template — problem, purpose, what it does, quick start, limitations
4. **Packages** a clean release zip using `git archive` (committed files only, no working tree debris)
5. **Publishes** a public GitHub repo with a prepared description and topic tags

## How It Works

The skill reads the project, forms a short public framing, asks you to confirm the intent when needed, and uses the code as the source of truth for docs and release decisions.

The release strategy distinguishes between two lanes: harden in place when the existing repo and git history are safe to expose, or create a clean public-export repo when the working project is good but the history has scratch commits, private notes, or experimental debris. The skill defaults to the safer lane.

## Quick Start

### Recommended: install via `npx skills`

The easiest path is the [`skills` CLI](https://github.com/vercel-labs/skills):

```bash
npx skills add davidvictor/build-in-public
```

To install globally without prompts:

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

### Manual install

Clone this repo into your local skills directory:

```bash
git clone https://github.com/davidvictor/build-in-public <your-skills-dir>/build-in-public
```

### Invoking

Once installed, run against any repo you want to publish:

```
build in public
```

If slash commands are available:

```
/build-in-public
```

## Usage

Point the skill at any local repo that already solves a real problem. It will:

1. Read the code and form hypotheses about the motivation
2. Ask you to confirm "the spark" (one of three proposed options, or your own phrasing)
3. Run the full audit → harden → docs → package → publish pass
4. Report the GitHub URL when done

The skill also works outside the default workspace — point it at any local path and it adapts.

## Included Files

| File | Purpose |
|------|---------|
| `SKILL.md` | The skill definition |
| `references/public-release-checklist.md` | Gate checklist used before publishing |
| `references/readme-template.md` | README structure template used when writing docs |
| `scripts/create_release_zip.sh` | Packages a clean zip from committed HEAD |

## Skill Notes

This project uses `SKILL.md` frontmatter.

The included `allowed-tools` and `version` fields are metadata; the workflow body does not depend on them. If your setup requires a smaller frontmatter surface, you can remove those fields in your fork.

## Requirements

- A local skills setup that can load `SKILL.md`
- Node.js/npm for the `npx skills` install path
- `git` for repo inspection and archive packaging
- `unzip` for release zip verification
- `gh` CLI for the GitHub publish step, with `gh auth login` configured
- `figlet` for the ASCII banner (`brew install figlet` on macOS)

## Limitations

- Tested on macOS. The shell scripts should work on Linux; Windows paths are not handled.
- Publishing requires GitHub and an authenticated `gh` CLI; audit, docs, and packaging can run without it.
- The skill is opinionated about README structure. If your project needs a different format, edit `references/readme-template.md` after cloning.
- History rewriting is explicitly out of scope — the skill prefers a clean public-export repo over `git filter-branch` surgery.
- The ASCII banner depends on `figlet`; install it first if you want that step included.

## License

MIT
