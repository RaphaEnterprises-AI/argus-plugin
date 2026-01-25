# Command Reference

Argus provides 7 slash commands for quality intelligence operations.

## `/argus:test [url]`

Run E2E tests on a web application.

### Usage
```
/argus:test https://demo.vercel.store
/argus:test                              # Uses project config or prompts for URL
```

### What It Does
1. Connects to Argus backend via MCP
2. Discovers interactive elements on the page
3. Generates test scenarios based on UI analysis
4. Executes tests using browser automation
5. Reports results with screenshots and video

### MCP Tools Used
- `argus_discover` - Find interactive elements
- `argus_test` - Execute test suite

---

## `/argus:discover [url]`

Discover all interactive elements on a web page.

### Usage
```
/argus:discover https://example.com
```

### Output
- Element inventory with counts by type
- Interactive element details (selector, text, purpose)
- Suggested test scenarios
- Screenshot of the page

### MCP Tools Used
- `argus_discover`

---

## `/argus:analyze [commit|branch]`

Analyze code changes to predict test failures.

### Usage
```
/argus:analyze HEAD~3          # Last 3 commits
/argus:analyze feature/auth    # Branch diff from main
/argus:analyze                 # Current uncommitted changes
```

### Output
- Test predictions with failure probability
- Security findings
- Risk score with deployment recommendation
- Suggested actions

### MCP Tools Used
- `argus_what_to_test`
- `argus_risk_scores`

---

## `/argus:review [PR#|URL]`

Perform AI-powered review of a pull request.

### Usage
```
/argus:review 123
/argus:review https://github.com/org/repo/pull/123
```

### Output
- Code review comments with severity
- Security findings
- Test coverage analysis
- Recommended actions before merge

### MCP Tools Used
- `argus_what_to_test`
- `argus_risk_scores`

---

## `/argus:heal [test-id]`

Self-heal broken tests by finding new selectors.

### Usage
```
/argus:heal test_login_flow    # Heal specific test
/argus:heal                    # Heal all failing tests
```

### Healing Capabilities
- **Selector Changes** - Finds new CSS/XPath selectors
- **Text Changes** - Updates text-based assertions
- **Timing Issues** - Adds appropriate waits
- **Layout Changes** - Adjusts coordinates/regions

### MCP Tools Used
- `argus_healing_review`
- `argus_healing_patterns`

---

## `/argus:report [--format md|json|html]`

Generate comprehensive test reports.

### Usage
```
/argus:report
/argus:report --format html
/argus:report my-project
```

### Report Contents
- **Summary** - Total tests, pass/fail, duration
- **Trends** - Pass rate over time, flaky tests
- **Coverage** - Components covered, gaps identified
- **Insights** - AI-generated recommendations

### MCP Tools Used
- `argus_dashboard`
- `argus_quality_stats`

---

## `/argus:status`

Check Argus connection and system status.

### Usage
```
/argus:status
```

### Output
```
Argus Connection Status

API: https://argus-mcp.samuelvinay-kumar.workers.dev
Status: Connected
Version: 3.1.0

Features:
  E2E Testing
  API Testing
  Commit Analysis
  Self-Healing
  Security Scanning
```

### MCP Tools Used
- `argus_health`
- `argus_auth_status`
