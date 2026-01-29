---
description: Self-heal a broken test by finding new selectors
args:
  - name: test_id
    description: The test ID to heal (optional - heals all failing tests if not provided)
    required: false
    type: string
allowed_tools:
  - mcp__argus__argus_healing_review
  - mcp__argus__argus_healing_patterns
  - mcp__argus__argus_healing_stats
  - mcp__argus__argus_healing_config
  - mcp__argus__argus_tests
---

# Argus Self-Healing

Automatically fix broken tests by finding alternative selectors or updating assertions.

## Usage

- `/argus heal [test-id]` - Heal a specific test
- `/argus heal` - Heal all failing tests in current project

## What This Does

1. Analyzes the test failure reason
2. Identifies the broken selector or assertion
3. Navigates to the page and finds alternatives
4. Updates the test definition
5. Re-runs to verify the fix

## Instructions

1. If no test_id provided, use `argus_tests` to find failing tests
2. Use `argus_healing_patterns` to find similar past fixes
3. Use `argus_healing_review` to apply the healing fix
4. Report the results with before/after selectors

## Self-Healing Capabilities

- **Selector Changes**: Finds new CSS/XPath selectors
- **Text Changes**: Updates text-based assertions
- **Timing Issues**: Adds appropriate waits
- **Layout Changes**: Adjusts coordinates/regions

## Example

```
/argus heal test_login_flow
/argus heal
```
