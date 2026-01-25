---
description: Review a pull request with AI-powered analysis
---

# Argus PR Review

Perform comprehensive review of a pull request including code quality, security, and test coverage.

## Usage

- `/argus:review [PR#]` - Review a specific PR by number
- `/argus:review [URL]` - Review a PR by GitHub URL

## What This Does

1. Fetches PR diff and metadata
2. Analyzes code changes for:
   - Code quality issues
   - Security vulnerabilities
   - Test coverage gaps
   - Performance concerns
3. Predicts test failures
4. Generates review comments

## Arguments

$ARGUMENTS

## Output

- Code review comments with severity
- Security findings
- Test predictions
- Recommended actions before merge

## Example

```
/argus:review 123
/argus:review https://github.com/org/repo/pull/123
```

Use the `argus_what_to_test` and `argus_risk_scores` MCP tools for commit impact analysis and format the output as a PR review.
