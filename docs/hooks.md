# Hooks Reference

Hooks are event-driven triggers that execute shell commands or scripts in response to Claude Code events.

## Available Hooks

### SessionStart

**Triggers:** When a Claude Code session begins

**Purpose:** Initialize session tracking and notify dashboard

**Configuration:**
```json
{
  "event": "SessionStart",
  "command": "curl -X POST ${ARGUS_API_URL}/api/v1/plugin/events ...",
  "timeout": 5000
}
```

**Events Sent:**
- Session ID
- User context
- Project information
- Timestamp

---

### PreToolUse

**Triggers:** Before a tool is executed

**Purpose:** Validate tool calls, check permissions, log intent

**Configuration:**
```json
{
  "event": "PreToolUse",
  "matcher": {
    "tool_name": "Bash|Write|Edit"
  },
  "command": "validate-tool-use.sh",
  "timeout": 3000
}
```

**Use Cases:**
- Block destructive commands
- Require confirmation for sensitive operations
- Audit logging

---

### PostToolUse

**Triggers:** After a tool completes execution

**Purpose:** Log results, track metrics, trigger follow-up actions

**Configuration:**
```json
{
  "event": "PostToolUse",
  "matcher": {
    "tool_name": "mcp__argus__.*"
  },
  "command": "log-argus-tool.sh",
  "timeout": 5000
}
```

**Data Available:**
- Tool name
- Input parameters
- Output/result
- Duration
- Success/failure status

---

### SessionEnd

**Triggers:** When a Claude Code session ends

**Purpose:** Clean up resources, report session summary

**Configuration:**
```json
{
  "event": "SessionEnd",
  "command": "curl -X POST ${ARGUS_API_URL}/api/v1/plugin/events ...",
  "timeout": 5000
}
```

**Metrics Reported:**
- Session duration
- Tools used
- Files modified
- Tests executed

---

## Hook Configuration

Hooks are defined in `hooks/hooks.json`:

```json
{
  "description": "Argus quality intelligence hooks",
  "hooks": [
    {
      "event": "SessionStart",
      "command": "...",
      "timeout": 5000
    },
    {
      "event": "PostToolUse",
      "matcher": { "tool_name": "mcp__argus__.*" },
      "command": "...",
      "timeout": 5000
    }
  ]
}
```

## Environment Variables

Hooks have access to these environment variables:

| Variable | Description |
|----------|-------------|
| `ARGUS_API_URL` | Argus backend API URL |
| `ARGUS_API_KEY` | API authentication key |
| `CLAUDE_SESSION_ID` | Current session identifier |
| `CLAUDE_PROJECT_PATH` | Project root directory |

## Best Practices

1. **Keep hooks fast** - Use timeouts under 5 seconds
2. **Handle failures gracefully** - Hooks should not block Claude
3. **Use async where possible** - Fire-and-forget for non-critical logging
4. **Secure sensitive data** - Never log API keys or secrets
