#!/bin/bash
# Extract git diff for commit impact analysis
# Usage: extract-diff.sh [commit|branch]
#
# If no argument provided, shows uncommitted changes
# If commit SHA provided, shows diff for that commit
# If branch name provided, shows diff from main/master to that branch

set -e

TARGET="${1:-}"

if [ -z "$TARGET" ]; then
    # No argument - show uncommitted changes (staged + unstaged)
    echo "=== Uncommitted Changes ==="
    git diff HEAD 2>/dev/null || git diff
elif git rev-parse --verify "$TARGET^{commit}" >/dev/null 2>&1; then
    # It's a valid commit SHA
    echo "=== Changes in commit: $TARGET ==="
    git show --stat "$TARGET"
    echo ""
    git diff "$TARGET^..$TARGET" 2>/dev/null || git show "$TARGET" --format=""
else
    # Assume it's a branch name - diff from main/master
    BASE_BRANCH="main"
    git rev-parse --verify "$BASE_BRANCH" >/dev/null 2>&1 || BASE_BRANCH="master"

    echo "=== Changes from $BASE_BRANCH to $TARGET ==="
    git diff "$BASE_BRANCH...$TARGET"
fi
