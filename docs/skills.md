# Skills Reference

Skills are auto-triggered prompts that Claude invokes based on context. Unlike commands (explicit `/slash` invocations), skills activate automatically when Claude detects relevant context.

## commit-impact-analysis

**Auto-triggers when:**
- User runs `git push` or `git commit`
- User asks "what might this break?"
- User creates or updates a PR
- User asks about test coverage for changes

**What it does:**
1. Extracts git diff
2. Identifies changed files and components
3. Queries test impact graph
4. Predicts test failures with confidence scores
5. Calculates risk score

**Output:**
- Test predictions table (test name, failure probability, reason)
- Security findings
- Risk assessment (low/medium/high)
- Recommended actions

**MCP Tools:**
- `argus_what_to_test`
- `argus_risk_scores`

---

## security-scan

**Auto-triggers when:**
- User edits code files (especially auth, database, API handlers)
- User asks "is this secure?"
- User asks about potential vulnerabilities
- Before committing sensitive code changes

**What it does:**
1. Identifies files to scan
2. Runs Semgrep with security rules
3. Checks for hardcoded secrets
4. Analyzes dependency vulnerabilities
5. Reports findings with severity

**Vulnerability Detection:**
- SQL injection
- XSS (Cross-Site Scripting)
- Command injection
- Hardcoded secrets
- Insecure deserialization
- Weak cryptography

**MCP Tools:**
- `argus_risk_scores`
- Local Semgrep integration

**Custom Rules:**
Located at `skills/security-scan/rules/custom-semgrep.yaml`

---

## test-suggestions

**Auto-triggers when:**
- User modifies source files
- User asks "what tests should I run?"
- User asks "will my changes break anything?"
- Before pushing changes

**What it does:**
1. Identifies changed files from git status
2. Queries test impact graph for file → test mapping
3. Considers historical co-failures
4. Prioritizes by impact score
5. Suggests minimal test set

**Output:**
| Priority | Test | Reason |
|----------|------|--------|
| Must Run | test_auth_login | Directly affected by auth.py changes |
| Should Run | test_api_users | Uses UserService (transitive) |
| Optional | test_e2e_checkout | Low probability of impact |

**MCP Tools:**
- `argus_what_to_test`

---

## flaky-detection

**Auto-triggers when:**
- Test fails unexpectedly after passing previously
- User asks "is this test flaky?"
- User asks "why does this test fail sometimes?"
- Test results are inconsistent across runs

**What it does:**
1. Queries test execution history
2. Analyzes pass/fail patterns over time
3. Identifies flakiness indicators
4. Calculates flakiness score
5. Suggests remediation strategies

**Flakiness Indicators:**
- **Timing Issues** - Async operations without proper waits
- **Race Conditions** - Resource contention
- **External Dependencies** - Network, databases, third-party services
- **State Leakage** - Previous tests affecting current state

**MCP Tools:**
- `argus_quality_stats`
- `argus_healing_patterns`

---

## Helper Scripts

### extract-diff.sh

Located at `skills/commit-impact/scripts/extract-diff.sh`

```bash
# Show uncommitted changes
./extract-diff.sh

# Show changes in specific commit
./extract-diff.sh abc123

# Show changes in branch vs main
./extract-diff.sh feature/new-auth
```
