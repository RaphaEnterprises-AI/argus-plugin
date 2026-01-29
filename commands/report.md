---
description: Generate a test report for the project
args:
  - name: project_id
    description: Project ID (optional - uses current project if not provided)
    required: false
    type: string
  - name: format
    description: Output format (md, json, or html)
    required: false
    type: string
    default: md
allowed_tools:
  - mcp__argus__argus_dashboard
  - mcp__argus__argus_quality_stats
  - mcp__argus__argus_quality_score
  - mcp__argus__argus_coverage_gaps
  - mcp__argus__argus_tests
---

# Argus Test Report

Generate comprehensive test reports with metrics, trends, and insights.

## Usage

- `/argus report` - Report for current project
- `/argus report [project-id]` - Report for specific project

## What This Does

1. Fetches test results from Argus
2. Calculates metrics (pass rate, duration, coverage)
3. Identifies trends and patterns
4. Generates formatted report

## Instructions

1. Use `argus_dashboard` to get project overview
2. Use `argus_quality_score` to get the quality score (0-100)
3. Use `argus_quality_stats` for detailed metrics
4. Use `argus_coverage_gaps` to identify missing test coverage
5. Format as a comprehensive markdown report

## Report Contents

- **Summary**: Total tests, pass/fail, duration
- **Quality Score**: 0-100 with breakdown
- **Trends**: Pass rate over time, flaky tests
- **Coverage**: Components covered, gaps identified
- **Insights**: AI-generated recommendations

## Example

```
/argus report
/argus report proj_abc123
```
