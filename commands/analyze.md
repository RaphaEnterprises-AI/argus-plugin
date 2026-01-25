---
description: Analyze commit impact - predict which tests might fail
---

# Argus Commit Impact Analysis

Analyze code changes to predict which tests might fail and identify potential risks.

## Usage

- `/argus:analyze` - Analyze current uncommitted changes
- `/argus:analyze [commit]` - Analyze a specific commit
- `/argus:analyze [branch]` - Analyze changes in a branch

## What This Does

1. Extracts the git diff for the specified changes
2. Identifies affected files and components
3. Queries the test impact graph
4. Matches against historical failure patterns
5. Calculates risk score and predictions

## Arguments

$ARGUMENTS

Accepts: commit SHA, branch name, or nothing (for current changes)

## Output

### Test Predictions
| Test | Failure Risk | Reason |
|------|-------------|--------|
| test_login | 🔴 85% | auth.py changed, 3 past failures |

### Risk Assessment
- Overall Risk Score
- Deployment recommendation
- Suggested actions

## Example

```
/argus:analyze HEAD~3
/argus:analyze feature/new-auth
```

Use the `mcp__argus__argus_analyze` MCP tool to perform analysis.
