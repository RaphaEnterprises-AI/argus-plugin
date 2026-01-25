# Changelog

All notable changes to the Argus Claude Code Plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-25

### Added

#### Commands (7)
- `/argus:test [url]` - Run E2E tests on any URL with browser automation
- `/argus:discover [url]` - Discover interactive elements on a web page
- `/argus:analyze [commit]` - Analyze commit impact and predict test failures
- `/argus:review [PR#]` - AI-powered pull request review
- `/argus:heal [test-id]` - Self-heal broken tests with new selectors
- `/argus:report` - Generate comprehensive test reports
- `/argus:status` - Check Argus connection and system health

#### Skills (4)
- `commit-impact-analysis` - Auto-triggered on git push/commit
- `security-scan` - Auto-triggered when editing sensitive code
- `test-suggestions` - Suggests minimal test set for changes
- `flaky-detection` - Identifies intermittent test failures

#### Agents (5)
- `e2e-tester` - Browser-based E2E testing with screenshots/video
- `api-tester` - API endpoint testing with schema validation
- `security-scanner` - SAST, secrets detection, CVE checking
- `performance-analyzer` - Core Web Vitals and regression detection
- `self-healer` - Auto-fix broken selectors and assertions

#### Hooks (4)
- `SessionStart` - Notify dashboard when Claude Code starts
- `PreToolUse` - Validate commands before execution
- `PostToolUse` - Log tool results for analytics
- `SessionEnd` - Clean up and report session metrics

### Infrastructure
- MCP server integration via SSE transport (Cloudflare Worker)
- 36+ MCP tools available for testing and analysis
- Dashboard event streaming for real-time monitoring

### Documentation
- Comprehensive README with installation and usage
- Command reference documentation
- Skill and agent capability descriptions

## [Unreleased]

### Planned
- Visual test regression detection
- AI-powered test generation from user stories
- Integration with CI/CD pipelines (GitHub Actions, GitLab CI)
- Custom Semgrep rule builder
- Performance budget enforcement
