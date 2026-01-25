---
description: Generate a test report for the project
---

# Argus Test Report

Generate comprehensive test reports with metrics, trends, and insights.

## Usage

- `/argus:report` - Report for current project
- `/argus:report [project-id]` - Report for specific project
- `/argus:report --format [md|json|html]` - Specify output format

## What This Does

1. Fetches test results from Argus
2. Calculates metrics (pass rate, duration, coverage)
3. Identifies trends and patterns
4. Generates formatted report

## Arguments

$ARGUMENTS

## Report Contents

- **Summary**: Total tests, pass/fail, duration
- **Trends**: Pass rate over time, flaky tests
- **Coverage**: Components covered, gaps identified
- **Insights**: AI-generated recommendations

## Example

```
/argus:report
/argus:report --format html
```

Use the `mcp__argus__argus_report` MCP tool to generate reports.
