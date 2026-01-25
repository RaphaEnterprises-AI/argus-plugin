---
description: Run E2E tests on a URL or the current project
---

# Argus Test Runner

Run comprehensive E2E tests using Argus autonomous testing agents.

## Usage

- `/argus:test [url]` - Test a specific URL
- `/argus:test` - Test the current project (uses project config)

## What This Does

1. Connects to the Argus backend via MCP
2. Discovers interactive elements on the page
3. Generates test scenarios based on the UI
4. Executes tests using browser automation
5. Reports results with screenshots and video

## Arguments

$ARGUMENTS

If no URL provided, will look for:
- `argus.config.json` in project root
- Environment variable `ARGUS_APP_URL`
- Ask for URL interactively

## Example

```
/argus:test https://demo.vercel.store
```

Use the `mcp__argus__argus_test` MCP tool to execute the tests. Display results in a formatted table with pass/fail status, screenshots, and any error messages.
