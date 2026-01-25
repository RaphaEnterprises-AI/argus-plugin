# 🔌 Argus Claude Code Plugin

**Full Stack Quality Intelligence** - Autonomous testing, commit analysis, and self-healing tests directly in your IDE.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

Argus is a Claude Code plugin that brings enterprise-grade quality intelligence to your development workflow:

- 🧪 **Autonomous E2E Testing** - Test any web application with natural language
- 🔍 **Commit Impact Analysis** - Predict which tests might fail before you push
- 🔒 **Security Scanning** - Find vulnerabilities in your code changes
- 🔧 **Self-Healing Tests** - Automatically fix broken selectors
- 📊 **Test Reports** - Generate comprehensive quality reports

## Installation

```bash
# Install the plugin
claude plugin install argus

# Or install from local directory during development
claude --plugin-dir ./argus-plugin
```

## Configuration

Set your Argus API credentials:

```bash
export ARGUS_API_URL="https://api.heyargus.ai"
export ARGUS_API_KEY="your-api-key"
```

## Commands

| Command | Description |
|---------|-------------|
| `/argus:test [url]` | Run E2E tests on a URL |
| `/argus:discover [url]` | Discover page elements |
| `/argus:analyze [commit]` | Analyze commit impact |
| `/argus:review [PR#]` | Review a pull request |
| `/argus:heal [test-id]` | Self-heal broken tests |
| `/argus:report` | Generate test report |
| `/argus:status` | Check Argus connection |

## Skills (Auto-Triggered)

These skills are automatically invoked by Claude when relevant:

- **commit-impact-analysis** - Triggered on git push/commit
- **security-scan** - Triggered when editing sensitive code
- **test-suggestions** - Suggests tests for changed files

## Agents

Specialized agents for complex tasks:

- **e2e-tester** - Browser-based E2E testing
- **api-tester** - API endpoint testing
- **security-scanner** - Security vulnerability scanning
- **self-healer** - Auto-fix broken tests

## Example Usage

### Run Tests
```
/argus:test https://demo.vercel.store
```

### Analyze Commit Impact
```
/argus:analyze HEAD~3
```

### Discover Elements
```
/argus:discover https://example.com
```

## Architecture

```
Claude Code
    │
    ├── Argus Plugin
    │   ├── /commands (user-invoked)
    │   ├── /skills (auto-triggered)
    │   ├── /agents (specialized)
    │   └── /hooks (event-driven)
    │
    └── Argus MCP Server (@heyargus/mcp-server)
        │
        └── Argus Backend API
            └── Supabase
```

## Development

```bash
# Clone the repo
git clone https://github.com/RaphaEnterprises-AI/argus-plugin.git
cd argus-plugin

# Test locally
claude --plugin-dir .

# Validate plugin
claude plugin validate
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Links

- 🌐 [Website](https://heyargus.ai)
- 📚 [Documentation](https://docs.heyargus.ai)
- 🐛 [Issues](https://github.com/RaphaEnterprises-AI/argus-plugin/issues)
- 💬 [Discord](https://discord.gg/heyargus)

---

Built with ❤️ by [Raphatech](https://raphatech.ai)
