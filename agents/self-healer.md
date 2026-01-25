---
description: Self-healing agent that automatically fixes broken tests by finding new selectors and updating assertions
capabilities:
  - Analyze test failure reasons
  - Find alternative selectors for broken elements
  - Update test definitions automatically
  - Verify fixes by re-running tests
---

# Self-Healer Agent

This agent specializes in automatically fixing broken tests.

## Overview

The Self-Healer Agent can autonomously:
1. Analyze why a test failed
2. Navigate to the affected page
3. Find alternative ways to locate elements
4. Update test definitions
5. Verify the fix works

## Capabilities

### Failure Analysis
- Parse error messages and stack traces
- Identify the type of failure (selector, timing, assertion)
- Determine the affected element

### Selector Healing
- Find elements by multiple strategies:
  - ID, class, data-testid
  - Text content
  - ARIA attributes
  - Position/structure
- Rank alternatives by stability
- Choose most robust selector

### Assertion Healing
- Detect changed text content
- Update expected values
- Adjust timing/waits

## MCP Tools Used

- `mcp__argus__argus_heal` - Perform self-healing
- `mcp__argus__argus_test` - Verify fixes
- `mcp__argus__argus_discover` - Find elements

## When to Invoke

- User runs `/argus:heal`
- Test fails due to selector not found
- Automated test run reports failures
