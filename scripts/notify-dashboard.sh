#!/bin/bash
# Notify Argus dashboard of plugin events
# Usage: notify-dashboard.sh <event_type>

EVENT_TYPE="$1"
API_URL="${ARGUS_API_URL:-https://api.heyargus.ai}"
API_KEY="${ARGUS_API_KEY}"

if [ -z "$API_KEY" ]; then
    # Silent exit if no API key configured
    exit 0
fi

# Collect context
SESSION_ID="${CLAUDE_SESSION_ID:-unknown}"
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Send event to Argus API
curl -s -X POST "${API_URL}/api/v1/plugin/events" \
    -H "Authorization: Bearer ${API_KEY}" \
    -H "Content-Type: application/json" \
    -d @- <<EOF
{
    "event_type": "${EVENT_TYPE}",
    "session_id": "${SESSION_ID}",
    "project_dir": "${PROJECT_DIR}",
    "timestamp": "${TIMESTAMP}",
    "claude_code_version": "${CLAUDE_CODE_VERSION:-unknown}"
}
EOF

exit 0
