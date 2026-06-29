#!/usr/bin/env bash
# Creates a clean release zip from the current HEAD of a git repo.
# Uses git archive so the zip contains only committed files — no working tree
# debris, no .git directory, no local caches or build artifacts.
#
# Usage:
#   bash create_release_zip.sh <repo-path> [output-dir]
#
# Output:
#   <output-dir>/<slug>/<slug>-v<version>.zip
#
# If output-dir is not provided:
#   - Default: /tmp/build-in-public/<slug>/
#   - Opportunistic (codex workspace): ~/.codex/workspaces/default/artifacts/<slug>/

set -euo pipefail

REPO_PATH="${1:?Usage: $0 <repo-path> [output-dir]}"
REPO_PATH="$(cd "$REPO_PATH" && pwd)"

if [ ! -d "$REPO_PATH/.git" ]; then
  echo "Error: $REPO_PATH is not a git repository." >&2
  exit 1
fi

# Derive slug from directory name
SLUG="$(basename "$REPO_PATH")"

# Determine version: prefer git tag on HEAD, fall back to short SHA
VERSION="$(git -C "$REPO_PATH" describe --tags --exact-match HEAD 2>/dev/null || true)"
if [ -z "$VERSION" ]; then
  VERSION="$(git -C "$REPO_PATH" rev-parse --short HEAD)"
fi

# Determine output directory
if [ -n "${2:-}" ]; then
  OUTPUT_DIR="$(mkdir -p "$2" && cd "$2" && pwd)"
elif [[ "$REPO_PATH" == *"/.codex/workspaces/default/"* ]]; then
  # Opportunistic: keep codex-workspace artifacts together when that's the host
  OUTPUT_DIR="$HOME/.codex/workspaces/default/artifacts/$SLUG"
else
  OUTPUT_DIR="/tmp/build-in-public/$SLUG"
fi

mkdir -p "$OUTPUT_DIR"

ZIP_NAME="${SLUG}-${VERSION}.zip"
ZIP_PATH="$OUTPUT_DIR/$ZIP_NAME"

# Check for uncommitted changes
if ! git -C "$REPO_PATH" diff --quiet HEAD 2>/dev/null; then
  echo "Warning: repo has uncommitted changes. The zip will contain only committed files." >&2
fi

echo "Creating zip from HEAD of $REPO_PATH ..."
git -C "$REPO_PATH" archive \
  --format=zip \
  --prefix="${SLUG}/" \
  HEAD \
  --output="$ZIP_PATH"

# Verify the zip is non-empty
FILE_COUNT="$(unzip -l "$ZIP_PATH" 2>/dev/null | tail -1 | awk '{print $2}')"
echo "Done."
echo ""
echo "  Artifact : $ZIP_PATH"
echo "  Version  : $VERSION"
echo "  Files    : $FILE_COUNT"
echo ""
echo "To verify: unzip -l \"$ZIP_PATH\""
