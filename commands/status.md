---
description: Check Argus connection and system status
allowed_tools:
  - mcp__argus__argus_health
  - mcp__argus__argus_auth_status
  - mcp__argus__argus_projects
  - mcp__argus__argus_dashboard
---

# Argus Status

Check the connection to Argus backend and display system status.

## Usage

`/argus status`

## What This Does

1. Tests connection to Argus API
2. Verifies API key validity
3. Checks available features
4. Reports system health

## Instructions

1. Use `argus_health` MCP tool to check API connectivity
2. Use `argus_auth_status` to verify authentication
3. Use `argus_projects` to list available projects
4. Present a formatted status report

## Output Format

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
