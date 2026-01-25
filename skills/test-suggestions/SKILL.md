---
name: test-suggestions
description: Suggest which tests to run based on code changes. Use this skill when the user modifies source files or asks what tests they should run.
---

# Test Suggestions

This skill suggests which tests to run based on code changes.

## When to Use

- User modifies source files
- User asks "what tests should I run?"
- User asks "will my changes break anything?"
- Before pushing changes

## How It Works

1. Identify changed files from git status
2. Query test impact graph for file → test mapping
3. Consider historical co-failures
4. Prioritize by impact score
5. Suggest minimal test set

## Output Format

### Suggested Tests
| Priority | Test | Reason |
|----------|------|--------|
| 🔴 Must Run | test_auth_login | Directly affected by auth.py changes |
| 🟡 Should Run | test_api_users | Uses UserService (transitive) |
| 🟢 Optional | test_e2e_checkout | Low probability of impact |

### Quick Command
```bash
pytest tests/test_auth_login.py tests/test_api_users.py
```

Estimated time: ~2 minutes
