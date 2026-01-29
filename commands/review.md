---
description: Review a pull request with AI-powered analysis
args:
  - name: pr
    description: PR number or GitHub URL
    required: true
    type: string
allowed_tools:
  - mcp__argus__argus_what_to_test
  - mcp__argus__argus_risk_scores
  - mcp__argus__argus_cicd_test_impact
  - mcp__argus__argus_cicd_deployment_risk
  - mcp__github__get_pull_request
  - mcp__github__get_pull_request_files
---

# Argus PR Review

Perform comprehensive review of a pull request including code quality, security, and test coverage.

## Usage

- `/argus review <PR#>` - Review a specific PR by number
- `/argus review <URL>` - Review a PR by GitHub URL

## What This Does

1. Fetches PR diff and metadata
2. Analyzes code changes for:
   - Code quality issues
   - Security vulnerabilities
   - Test coverage gaps
   - Performance concerns
3. Predicts test failures
4. Generates review comments

## Instructions

1. Parse the PR number from the argument (strip URL if provided)
2. Use GitHub MCP tools to fetch PR details and changed files
3. Use `argus_cicd_test_impact` to analyze which tests are affected
4. Use `argus_risk_scores` to calculate deployment risk
5. Format output as a structured review

## Output

- Code review comments with severity
- Security findings
- Test predictions
- Recommended actions before merge

## Example

```
/argus review 123
/argus review https://github.com/org/repo/pull/123
```
