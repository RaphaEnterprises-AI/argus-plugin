---
description: Analyze commit impact - predict which tests might fail
args:
  - name: target
    description: Commit SHA, branch name, or empty for uncommitted changes
    required: false
    type: string
allowed_tools:
  - mcp__argus__argus_what_to_test
  - mcp__argus__argus_risk_scores
  - mcp__argus__argus_cicd_test_impact
  - Bash
---

# Argus Commit Impact Analysis

Analyze code changes to predict which tests might fail and identify potential risks.

## Usage

- `/argus analyze` - Analyze current uncommitted changes
- `/argus analyze [commit]` - Analyze a specific commit
- `/argus analyze [branch]` - Analyze changes in a branch

## What This Does

1. Extracts the git diff for the specified changes
2. Identifies affected files and components
3. Queries the test impact graph
4. Matches against historical failure patterns
5. Calculates risk score and predictions

## Instructions

1. If a target is provided, use it. Otherwise, analyze uncommitted changes.
2. Run the extract-diff script to get the git diff:
   ```bash
   ${CLAUDE_PLUGIN_ROOT}/skills/commit-impact/scripts/extract-diff.sh [target]
   ```
3. Use `argus_what_to_test` MCP tool to get test recommendations
4. Use `argus_risk_scores` MCP tool to get risk assessment
5. Present results as formatted tables

## Output Format

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
/argus analyze HEAD~3
/argus analyze feature/new-auth
```
