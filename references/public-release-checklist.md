# Public Release Checklist

Use this as a gate before publishing and again as a final completion check.

---

## Secrets & Privacy (Blockers — nothing ships until these are clear)

- [ ] No API keys, tokens, passwords, or credentials in tracked files
- [ ] No secrets in git history (`git log -p | grep -iE "key|secret|token|password|bearer|api_key"`)
- [ ] No `.env` files tracked (`.env` and `.env.*` in `.gitignore`)
- [ ] No personal email addresses in code or config (check `git log` author too)
- [ ] No absolute local paths baked into source or scripts
- [ ] No internal hostnames, private URLs, or intranet references
- [ ] No proprietary data, vendor assets, or licensed samples that can't be redistributed
- [ ] No private screenshots, recordings, or binary blobs in history

---

## Repository Shape

- [ ] `.gitignore` present and covers: env files, caches, build output, OS artifacts, editor files, local databases
- [ ] `LICENSE` present (default MIT)
- [ ] Dependencies documented: `requirements.txt` / `package.json` / `go.mod` / `Cargo.toml` / `Gemfile` as appropriate
- [ ] `env.example` present if the project requires env vars, with every key listed and described
- [ ] No untracked files that should be tracked
- [ ] No committed files that should be ignored
- [ ] Git history tells a coherent story, or a clean export was made instead

---

## Functionality

- [ ] Install steps work from a clean clone (no undocumented prerequisites)
- [ ] Primary entrypoint runs without crashing on first invocation
- [ ] Error messages are readable when something is misconfigured
- [ ] Tests exist and pass (`make test` / `pytest` / `npm test` / equivalent)
- [ ] Smoke check covers the main path
- [ ] At least one edge case or failure mode is tested
- [ ] No debug output, timing instrumentation, or dev-only flags left enabled

---

## Documentation

- [ ] README exists and is complete (not a stub)
- [ ] README opens with the problem and the thesis — why this exists
- [ ] Quick-start path is present and matches actual code
- [ ] Configuration and required env vars are documented
- [ ] Limitations and known rough edges are stated honestly
- [ ] No placeholder text (`TODO`, `YOUR_VALUE_HERE`, `coming soon`, `...`)
- [ ] One-line GitHub description prepared
- [ ] Topic tags prepared (language + domain + what it does)

---

## Packaging

- [ ] Release zip created from committed HEAD (not from working tree)
- [ ] Zip does not contain `.git/`, caches, or build artifacts
- [ ] Zip unpacks cleanly and install steps work from it

---

## Final Gate

Before `gh repo create`:

1. Cold-read the README as a stranger. Does it make sense without prior context?
2. Check `git status` — working tree is clean or only contains intentional untracked files.
3. Run the tests one more time from a clean state.
4. Confirm with the user that publish should proceed.
