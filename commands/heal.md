---
description: Self-heal a broken test by finding new selectors
---

# Argus Self-Healing

Automatically fix broken tests by finding alternative selectors or updating assertions.

## Usage

- `/argus:heal [test-id]` - Heal a specific test
- `/argus:heal` - Heal all failing tests in current project

## What This Does

1. Analyzes the test failure reason
2. Identifies the broken selector or assertion
3. Navigates to the page and finds alternatives
4. Updates the test definition
5. Re-runs to verify the fix

## Arguments

$ARGUMENTS

## Self-Healing Capabilities

- **Selector Changes**: Finds new CSS/XPath selectors
- **Text Changes**: Updates text-based assertions
- **Timing Issues**: Adds appropriate waits
- **Layout Changes**: Adjusts coordinates/regions

## Example

```
/argus:heal test_login_flow
/argus:heal
```

Use the `mcp__argus__argus_heal` MCP tool to perform self-healing.
