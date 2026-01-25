# MCP Tools API Reference

The Argus plugin connects to the Argus MCP Server which provides 36+ tools for testing and quality intelligence.

## Connection

**Transport:** SSE (Server-Sent Events)
**URL:** `https://argus-mcp.samuelvinay-kumar.workers.dev/sse`
**Version:** 3.1.0

## Authentication Tools

### argus_auth
Initiate authentication flow with Argus.

### argus_auth_complete
Complete authentication with verification code.

### argus_auth_status
Check current authentication status.

### argus_auth_logout
Log out and clear credentials.

---

## Core Testing Tools

### argus_discover
Discover interactive elements on a web page.

**Input:**
```json
{
  "url": "https://example.com",
  "viewport": "desktop"
}
```

**Output:** Element inventory with selectors and purposes.

### argus_test
Execute browser-based tests.

**Input:**
```json
{
  "url": "https://example.com",
  "test_cases": [...],
  "record_video": true
}
```

**Output:** Test results with screenshots and video URL.

### argus_act
Perform individual browser actions.

**Input:**
```json
{
  "action": "click",
  "selector": "#submit-btn"
}
```

### argus_extract
Extract data from the current page.

**Input:**
```json
{
  "selector": ".product-price",
  "attribute": "text"
}
```

### argus_agent
Run autonomous testing agent.

### argus_generate_test
Generate test cases from page analysis.

---

## Quality Intelligence Tools

### argus_quality_score
Get overall quality score for a project.

### argus_quality_stats
Get detailed quality statistics and trends.

### argus_risk_scores
Calculate risk scores for code changes.

**Input:**
```json
{
  "commit": "abc123",
  "include_security": true
}
```

### argus_what_to_test
Determine which tests to run for changes.

**Input:**
```json
{
  "diff": "...",
  "files": ["auth.py", "users.py"]
}
```

### argus_coverage_gaps
Identify areas lacking test coverage.

---

## Self-Healing Tools

### argus_healing_config
Configure self-healing behavior.

### argus_healing_patterns
Find patterns from past successful healings.

### argus_healing_stats
Get healing statistics and success rates.

### argus_healing_review
Review and apply healing suggestions.

---

## Sync & Export Tools

### argus_sync_push
Push local changes to Argus cloud.

### argus_sync_pull
Pull latest from Argus cloud.

### argus_sync_status
Check sync status.

### argus_sync_resolve
Resolve sync conflicts.

### argus_export
Export tests to various formats.

### argus_export_languages
Export tests to different programming languages.

---

## Recording Tools

### argus_recording_to_test
Convert browser recording to test case.

### argus_recording_snippet
Generate code snippet from recording.

---

## Collaboration Tools

### argus_presence
Check who else is working on tests.

### argus_comments
View and add comments on tests.

### argus_events
List recent events and activity.

### argus_test_from_event
Generate test from error event.

### argus_event_triage
Triage and prioritize events.

---

## Project Management Tools

### argus_projects
List and manage projects.

### argus_tests
List and manage test cases.

### argus_test_review
Review test results and history.

### argus_batch_generate
Generate tests in batch.

---

## Infrastructure Tools

### argus_dashboard
Get dashboard summary data.

### argus_infra_overview
Get infrastructure overview.

### argus_infra_recommendations
Get infrastructure optimization suggestions.

### argus_infra_apply
Apply infrastructure changes.

### argus_llm_usage
View LLM token usage and costs.

### argus_browser_pool
Manage browser pool for testing.

---

## AI Tools

### argus_ask
Ask questions about your tests and codebase.

**Input:**
```json
{
  "question": "Why is the login test flaky?"
}
```

---

## Error Handling

All tools return errors in a consistent format:

```json
{
  "error": true,
  "message": "Description of what went wrong",
  "code": "ERROR_CODE"
}
```

Common error codes:
- `AUTH_REQUIRED` - Need to authenticate first
- `NOT_FOUND` - Resource not found
- `RATE_LIMITED` - Too many requests
- `TIMEOUT` - Operation timed out
