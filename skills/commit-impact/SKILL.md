---
name: commit-impact-analysis
description: Automatically analyze git commits to predict which tests might fail and identify potential risks. Use this skill when the user pushes code, creates a PR, or asks about the impact of their changes.
---

# Commit Impact Analysis

This skill analyzes code changes to predict:
- Which tests are likely to fail
- Security vulnerabilities introduced
- Performance impacts
- Risk score for the change

## When to Use

- User runs `git push` or `git commit`
- User asks "what might this break?"
- User creates or updates a PR
- User asks about test coverage for changes

## How It Works

1. Extract the git diff using the helper script
2. Identify changed files and affected components
3. Query the Argus API for:
   - Test impact graph (file → test mapping)
   - Historical failure patterns
   - Security scan results
4. Generate predictions and recommendations

## Implementation

Use the `mcp__argus__argus_analyze` MCP tool with the commit SHA or branch name.

The tool returns:
- Predicted test failures with confidence scores
- Security vulnerabilities found
- Risk assessment (low/medium/high)
- Recommended actions

## Output Format

Present findings as a structured report:
1. 🧪 Test Predictions (table with test name, failure probability, reason)
2. 🔒 Security Findings (severity, location, recommendation)
3. 📊 Risk Score with deployment recommendation
4. 💡 Suggested Actions
