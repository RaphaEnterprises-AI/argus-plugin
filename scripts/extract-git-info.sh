#!/bin/bash
# Extract git information for commit analysis
# Usage: extract-git-info.sh [commit]

COMMIT="${1:-HEAD}"

# Output JSON with git info
cat <<EOF
{
    "commit": "$(git rev-parse ${COMMIT} 2>/dev/null || echo 'unknown')",
    "branch": "$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unknown')",
    "author": "$(git log -1 --format='%an' ${COMMIT} 2>/dev/null || echo 'unknown')",
    "message": "$(git log -1 --format='%s' ${COMMIT} 2>/dev/null || echo 'unknown')",
    "changed_files": $(git diff --name-only ${COMMIT}^..${COMMIT} 2>/dev/null | jq -R -s -c 'split("\n") | map(select(. != ""))' || echo '[]'),
    "stats": {
        "files_changed": $(git diff --stat ${COMMIT}^..${COMMIT} 2>/dev/null | tail -1 | grep -oE '[0-9]+' | head -1 || echo '0'),
        "insertions": $(git diff --stat ${COMMIT}^..${COMMIT} 2>/dev/null | tail -1 | grep -oE '[0-9]+ insertion' | grep -oE '[0-9]+' || echo '0'),
        "deletions": $(git diff --stat ${COMMIT}^..${COMMIT} 2>/dev/null | tail -1 | grep -oE '[0-9]+ deletion' | grep -oE '[0-9]+' || echo '0')
    }
}
EOF
