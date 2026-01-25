---
name: security-scan
description: Scan code changes for security vulnerabilities. Use this skill when the user edits code files, asks about security, or before committing sensitive changes.
---

# Security Scan

This skill scans code for security vulnerabilities including:
- SQL injection
- XSS (Cross-Site Scripting)
- Command injection
- Hardcoded secrets
- Vulnerable dependencies

## When to Use

- User edits code files (especially auth, database, API handlers)
- User asks "is this secure?"
- User asks about potential vulnerabilities
- Before committing code that handles sensitive data

## How It Works

1. Identify files to scan (changed or specified)
2. Run Semgrep with security rules
3. Check for hardcoded secrets
4. Analyze dependency vulnerabilities
5. Report findings with severity

## Implementation

Use the `mcp__argus__argus_security` MCP tool.

## Output Format

### Security Findings
| Severity | Issue | Location | Recommendation |
|----------|-------|----------|----------------|
| 🔴 High | SQL Injection | users.py:45 | Use parameterized queries |
| 🟡 Medium | Missing CSRF | views.py:123 | Add CSRF token |

### Risk Score
- Overall: Medium (0.55)
- Action Required: Review findings before deploy
