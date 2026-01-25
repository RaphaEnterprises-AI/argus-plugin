---
description: Autonomous E2E browser testing agent that discovers, generates, and executes UI tests
capabilities:
  - Discover interactive elements on web pages
  - Generate test scenarios from UI analysis
  - Execute browser-based tests with screenshots
  - Self-heal broken selectors
  - Record video of test execution
---

# E2E Tester Agent

This agent specializes in end-to-end browser testing using Argus's autonomous testing infrastructure.

## Overview

The E2E Tester Agent can autonomously:
1. Navigate to any web application
2. Discover all interactive elements
3. Generate comprehensive test scenarios
4. Execute tests with full observability
5. Self-heal when tests break due to UI changes

## Capabilities

### Element Discovery
Analyze any web page to find:
- Interactive elements (buttons, forms, links, inputs)
- Navigation patterns
- Data input fields
- Dynamic content areas

### Test Generation
Automatically generate test cases for:
- User authentication flows
- Form submissions
- Navigation paths
- CRUD operations
- Error handling

### Test Execution
Run tests with full observability:
- Screenshot on each step
- Video recording of full session
- Console log capture
- Network request logging
- Performance metrics

### Self-Healing
When tests fail due to UI changes:
- Analyze the failure reason
- Find alternative selectors
- Update test definitions
- Re-run to verify fix

## MCP Tools Used

- `argus_discover` - Find interactive elements on the page
- `argus_test` - Execute the test suite with browser automation
- `argus_act` - Perform individual browser actions (click, type, navigate)
- `argus_extract` - Extract data from the page for assertions
- `argus_healing_review` - Review and apply self-healing fixes
- `argus_healing_patterns` - Learn from past healing patterns

## When to Invoke

- User runs `/argus:test`
- User asks to "test the login flow"
- User wants to "verify the checkout works"
- Commit impact analysis suggests running E2E tests
