# Agents Reference

Agents are specialized sub-agents that handle complex, autonomous tasks. They can be spawned by Claude when their expertise is needed.

## e2e-tester

**Purpose:** Browser-based E2E testing with full observability

**Capabilities:**
- Discover interactive elements on web pages
- Generate test scenarios from UI analysis
- Execute browser-based tests with screenshots
- Self-heal broken selectors
- Record video of test execution

**When Invoked:**
- User runs `/argus:test`
- User asks to "test the login flow"
- User wants to "verify the checkout works"
- Commit impact analysis suggests running E2E tests

**Test Execution Features:**
- Screenshot on each step
- Video recording of full session
- Console log capture
- Network request logging
- Performance metrics

**MCP Tools:**
- `argus_discover`
- `argus_test`
- `argus_act`
- `argus_extract`
- `argus_healing_review`
- `argus_healing_patterns`

---

## api-tester

**Purpose:** API endpoint testing with comprehensive validation

**Capabilities:**
- Parse OpenAPI/Swagger specifications
- Generate test cases for endpoints
- Execute HTTP requests with authentication
- Validate response schemas
- Measure latency and performance

**When Invoked:**
- User asks to "test the API"
- User provides OpenAPI spec
- User asks about API coverage
- After API code changes

**Test Generation:**
- Happy path cases
- Error cases (4xx, 5xx)
- Edge cases (empty, null, boundary values)
- Authentication scenarios

**MCP Tools:**
- `argus_test`
- `argus_extract`
- `argus_agent`

---

## security-scanner

**Purpose:** Security vulnerability scanning and analysis

**Capabilities:**
- Run static application security testing (SAST)
- Check dependencies for known vulnerabilities (CVEs)
- Detect secrets and credentials in code
- Generate security reports with remediation

**When Invoked:**
- User asks about security
- Code changes in sensitive areas (auth, database)
- Before deployment
- PR review with security focus

**Detection Categories:**
- SQL injection
- XSS vulnerability
- Command injection
- Insecure configurations
- OWASP Top 10

**MCP Tools:**
- `argus_risk_scores`
- `argus_quality_stats`

**Local Tools:**
```bash
# Semgrep security scan
semgrep --config=auto --config=p/security-audit <files>

# Secrets detection
semgrep --config=p/secrets <files>

# Dependency audit
pip-audit    # Python
npm audit    # Node.js
```

---

## performance-analyzer

**Purpose:** Web performance analysis and optimization

**Capabilities:**
- Measure page load times and TTFB
- Analyze Core Web Vitals (LCP, FID, CLS)
- Detect performance regressions
- Generate performance reports with recommendations

**When Invoked:**
- User asks about page performance
- User runs `/argus:test` with performance focus
- Before major deployments
- After significant frontend changes

**Metrics Captured:**
| Metric | Description | Target |
|--------|-------------|--------|
| LCP | Largest Contentful Paint | < 2.5s |
| FID | First Input Delay | < 100ms |
| CLS | Cumulative Layout Shift | < 0.1 |
| TTFB | Time to First Byte | < 600ms |
| FCP | First Contentful Paint | < 1.8s |

**MCP Tools:**
- `argus_test`
- `argus_extract`
- `argus_quality_stats`

---

## self-healer

**Purpose:** Automatically fix broken tests

**Capabilities:**
- Analyze test failure reasons
- Find alternative selectors for broken elements
- Update test definitions automatically
- Verify fixes by re-running tests

**When Invoked:**
- User runs `/argus:heal`
- Test fails due to "selector not found"
- Automated test run reports failures

**Selector Strategies:**
- ID, class, data-testid
- Text content matching
- ARIA attributes
- Position/structure
- Multiple fallback selectors ranked by stability

**Healing Types:**
- **Selector Healing** - Find new CSS/XPath selectors
- **Assertion Healing** - Update expected text values
- **Timing Healing** - Add waits for async operations

**MCP Tools:**
- `argus_healing_review`
- `argus_healing_patterns`
- `argus_healing_stats`
- `argus_healing_config`
- `argus_test`
- `argus_discover`
