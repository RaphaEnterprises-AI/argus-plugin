---
description: Run E2E tests on a URL or the current project
args:
  - name: url
    description: The URL to test (optional - uses project config if not provided)
    required: false
    type: string
allowed_tools:
  - mcp__argus__argus_discover
  - mcp__argus__argus_test
  - mcp__argus__argus_act
  - mcp__argus__argus_extract
  - mcp__argus__argus_healing_review
---

# Argus Test Runner

Run comprehensive E2E tests using Argus autonomous testing agents.

## Usage

- `/argus test [url]` - Test a specific URL
- `/argus test` - Test the current project (uses project config)

## What This Does

1. Connects to the Argus backend via MCP
2. Discovers interactive elements on the page
3. Generates test scenarios based on the UI
4. Executes tests using browser automation
5. Reports results with screenshots and video

## Instructions

If no URL is provided via arguments, look for:
- `argus.config.json` in project root
- Environment variable `ARGUS_APP_URL`
- Ask the user for a URL interactively

Use the following MCP tools in order:
1. `argus_discover` to find interactive elements on the page
2. `argus_test` to execute test scenarios with browser automation

Display results in a formatted table with pass/fail status, screenshots, and any error messages.

## Example

```
/argus test https://demo.vercel.store
```
