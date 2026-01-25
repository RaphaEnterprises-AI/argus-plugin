---
description: Check Argus connection and system status
---

# Argus Status

Check the connection to Argus backend and display system status.

## Usage

`/argus:status`

## What This Does

1. Tests connection to Argus API
2. Verifies API key validity
3. Checks available features
4. Reports system health

## Output

```
✅ Argus Connection Status

API: https://api.heyargus.ai
Status: Connected
Version: 1.0.0

Features:
  ✅ E2E Testing
  ✅ API Testing
  ✅ Commit Analysis
  ✅ Self-Healing
  ✅ Security Scanning

Project: my-project
Tests: 42 total, 38 passing
Last Run: 2 hours ago
```

Use the `argus_health` MCP tool to check system status and `argus_auth_status` for authentication status.
