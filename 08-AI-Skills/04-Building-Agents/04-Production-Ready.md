# Production-Ready Agents

## Quick Take

A working agent is just the start. Production agents need logging, monitoring, error handling, cost controls, and security. This chapter covers what it takes to deploy agents reliably.

**Remember:** Production is where agents meet reality. users, edge cases, failures, and costs. Plan for all of them.

---

## Production Checklist

```
┌─────────────────────────────────────────────────────────────┐
│ PRODUCTION READINESS CHECKLIST                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  □ RELIABILITY                                              │
│    □ Error handling for all failure modes                  │
│    □ Retry logic with exponential backoff                  │
│    □ Graceful degradation                                  │
│    □ Timeout handling                                       │
│                                                             │
│  □ OBSERVABILITY                                            │
│    □ Logging of all LLM calls and tool executions          │
│    □ Token usage tracking                                   │
│    □ Latency metrics                                        │
│    □ Error rate monitoring                                  │
│                                                             │
│  □ COST CONTROL                                             │
│    □ Per-request token limits                              │
│    □ Daily/monthly budget caps                             │
│    □ Usage alerts                                           │
│                                                             │
│  □ SECURITY                                                 │
│    □ Input validation                                       │
│    □ Tool permission controls                              │
│    □ Prompt injection protection                           │
│    □ Secrets management                                     │
│                                                             │
│  □ TESTING                                                  │
│    □ Unit tests for tools                                  │
│    □ Integration tests for agent flow                      │
│    □ Eval suite for quality                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Error Handling

### Comprehensive Try-Catch

```python
from enum import Enum
from dataclasses import dataclass
import time

class ErrorType(Enum):
    API_ERROR = "api_error"
    RATE_LIMIT = "rate_limit"
    TIMEOUT = "timeout"
    TOOL_ERROR = "tool_error"
    VALIDATION_ERROR = "validation_error"
    UNKNOWN = "unknown"

@dataclass
class AgentError:
    type: ErrorType
    message: str
    recoverable: bool
    retry_after: int = 0

class RobustAgent:
    def __init__(self, ...):
        self.max_retries = 3
        self.base_delay = 1

    def _call_llm_with_retry(self, messages, tools):
        """Call LLM with retry logic."""

        for attempt in range(self.max_retries):
            try:
                response = self.client.messages.create(
                    model=self.model,
                    messages=messages,
                    tools=tools,
                    timeout=30  # Always set timeout
                )
                return response

            except anthropic.RateLimitError as e:
                delay = self.base_delay * (2 ** attempt)
                self.logger.warning(f"Rate limited, waiting {delay}s")
                time.sleep(delay)

            except anthropic.APITimeoutError:
                self.logger.warning(f"Timeout on attempt {attempt + 1}")
                if attempt == self.max_retries - 1:
                    raise AgentError(
                        type=ErrorType.TIMEOUT,
                        message="LLM call timed out after retries",
                        recoverable=False
                    )

            except anthropic.APIError as e:
                self.logger.error(f"API error: {e}")
                raise AgentError(
                    type=ErrorType.API_ERROR,
                    message=str(e),
                    recoverable=False
                )

        raise AgentError(
            type=ErrorType.RATE_LIMIT,
            message="Max retries exceeded",
            recoverable=False
        )

    def _execute_tool_safely(self, name, args):
        """Execute tool with error handling."""

        try:
            result = self.tools.execute(name, args)
            return {"success": True, "result": result}

        except Exception as e:
            self.logger.error(f"Tool {name} failed: {e}")
            return {
                "success": False,
                "error": str(e),
                "suggestion": "Try a different approach or tool"
            }
```

---

## Logging & Observability

### Structured Logging

```python
import logging
import json
from datetime import datetime
from dataclasses import dataclass, asdict

@dataclass
class LLMCallLog:
    timestamp: str
    model: str
    input_tokens: int
    output_tokens: int
    latency_ms: int
    success: bool
    error: str = None

@dataclass
class ToolCallLog:
    timestamp: str
    tool_name: str
    args: dict
    result: str
    latency_ms: int
    success: bool

class AgentLogger:
    def __init__(self, session_id: str):
        self.session_id = session_id
        self.logger = logging.getLogger(f"agent.{session_id}")

        # Configure structured logging
        handler = logging.StreamHandler()
        handler.setFormatter(logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        ))
        self.logger.addHandler(handler)
        self.logger.setLevel(logging.INFO)

        # Metrics tracking
        self.total_tokens = 0
        self.total_cost = 0
        self.tool_calls = 0
        self.llm_calls = 0

    def log_llm_call(self, log: LLMCallLog):
        self.llm_calls += 1
        self.total_tokens += log.input_tokens + log.output_tokens
        self.logger.info(f"LLM_CALL: {json.dumps(asdict(log))}")

    def log_tool_call(self, log: ToolCallLog):
        self.tool_calls += 1
        self.logger.info(f"TOOL_CALL: {json.dumps(asdict(log))}")

    def log_error(self, error: str, context: dict = None):
        self.logger.error(f"ERROR: {error} | Context: {context}")

    def get_metrics(self) -> dict:
        return {
            "session_id": self.session_id,
            "total_tokens": self.total_tokens,
            "llm_calls": self.llm_calls,
            "tool_calls": self.tool_calls,
            "estimated_cost": self._estimate_cost()
        }

    def _estimate_cost(self) -> float:
        # Rough estimate - adjust based on actual model pricing
        return self.total_tokens * 0.00001  # $0.01 per 1K tokens avg
```

---

## Cost Controls

### Token and Budget Limits

```python
from dataclasses import dataclass

@dataclass
class CostLimits:
    max_tokens_per_request: int = 50000
    max_tokens_per_session: int = 200000
    max_iterations: int = 50
    daily_budget_usd: float = 10.0

class CostController:
    def __init__(self, limits: CostLimits):
        self.limits = limits
        self.session_tokens = 0
        self.daily_spend = 0
        self.iteration_count = 0

    def check_limits(self) -> tuple[bool, str]:
        """Check if we're within limits. Returns (ok, reason)."""

        if self.iteration_count >= self.limits.max_iterations:
            return False, f"Max iterations ({self.limits.max_iterations}) reached"

        if self.session_tokens >= self.limits.max_tokens_per_session:
            return False, f"Session token limit ({self.limits.max_tokens_per_session}) reached"

        estimated_spend = self.session_tokens * 0.00001
        if estimated_spend >= self.limits.daily_budget_usd:
            return False, f"Daily budget (${self.limits.daily_budget_usd}) exceeded"

        return True, ""

    def record_usage(self, tokens: int):
        self.session_tokens += tokens
        self.iteration_count += 1

    def can_proceed(self) -> bool:
        ok, _ = self.check_limits()
        return ok

# Usage in agent
class ProductionAgent:
    def run(self, goal: str):
        while True:
            # Check costs before each iteration
            ok, reason = self.cost_controller.check_limits()
            if not ok:
                self.logger.warning(f"Stopping: {reason}")
                return f"Stopped: {reason}"

            # Proceed with LLM call
            response = self._call_llm(...)

            # Record usage
            self.cost_controller.record_usage(
                response.usage.input_tokens + response.usage.output_tokens
            )
```

---

## Security

### Input Validation

```python
import re

class InputValidator:
    def __init__(self):
        self.max_input_length = 10000
        self.blocked_patterns = [
            r"ignore previous instructions",
            r"system prompt",
            r"jailbreak",
            r"<script>",  # XSS attempt
        ]

    def validate(self, user_input: str) -> tuple[bool, str]:
        """Validate user input. Returns (valid, reason)."""

        # Length check
        if len(user_input) > self.max_input_length:
            return False, "Input too long"

        # Pattern check
        lower_input = user_input.lower()
        for pattern in self.blocked_patterns:
            if re.search(pattern, lower_input):
                return False, "Potentially harmful input detected"

        return True, ""

    def sanitize(self, user_input: str) -> str:
        """Sanitize input (use in addition to validation)."""
        # Remove potential injection markers
        sanitized = user_input.replace("```", "")

        # Truncate if needed
        if len(sanitized) > self.max_input_length:
            sanitized = sanitized[:self.max_input_length]

        return sanitized
```

### Tool Permission Control

```python
from enum import Enum
from dataclasses import dataclass

class PermissionLevel(Enum):
    READ = "read"
    WRITE = "write"
    EXECUTE = "execute"
    ADMIN = "admin"

@dataclass
class ToolPermission:
    tool_name: str
    required_level: PermissionLevel
    requires_confirmation: bool = False

class PermissionController:
    def __init__(self, user_level: PermissionLevel):
        self.user_level = user_level
        self.permission_order = [
            PermissionLevel.READ,
            PermissionLevel.WRITE,
            PermissionLevel.EXECUTE,
            PermissionLevel.ADMIN
        ]

    def can_use_tool(self, tool_permission: ToolPermission) -> bool:
        """Check if user can use this tool."""
        user_idx = self.permission_order.index(self.user_level)
        required_idx = self.permission_order.index(tool_permission.required_level)
        return user_idx >= required_idx

    def filter_tools(self, tools: list[Tool]) -> list[Tool]:
        """Return only tools the user can access."""
        return [t for t in tools if self.can_use_tool(t.permission)]
```

---

## Testing

### Unit Tests for Tools

```python
import pytest

def test_search_tool_returns_results():
    tool = SearchTool()
    result = tool.execute(query="python programming")

    assert result["success"] is True
    assert len(result["results"]) > 0

def test_search_tool_handles_empty_query():
    tool = SearchTool()
    result = tool.execute(query="")

    assert result["success"] is False
    assert "error" in result

def test_file_tool_respects_permissions():
    tool = FileTool(allowed_paths=["/safe/"])
    result = tool.execute(path="/unsafe/secrets.txt")

    assert result["success"] is False
    assert "permission" in result["error"].lower()
```

### Integration Tests for Agent Flow

```python
def test_agent_completes_simple_task():
    agent = ProductionAgent(...)
    result = agent.run("What is 2 + 2?")

    assert "4" in result
    assert agent.cost_controller.iteration_count < 5

def test_agent_respects_token_limits():
    limits = CostLimits(max_tokens_per_session=1000)
    agent = ProductionAgent(cost_limits=limits, ...)

    result = agent.run("Write a very long essay about everything")

    assert "limit" in result.lower() or agent.cost_controller.session_tokens <= 1000

def test_agent_handles_tool_failure():
    # Mock a failing tool
    agent = ProductionAgent(...)
    agent.tools.register(Tool(
        name="always_fails",
        func=lambda: raise_error("Oops!")
    ))

    result = agent.run("Use always_fails tool")

    # Agent should handle gracefully, not crash
    assert result is not None
```

### Eval Suite for Quality

```python
# Define test cases with expected behavior
EVAL_CASES = [
    {
        "input": "What's the capital of France?",
        "expected_contains": ["Paris"],
        "max_iterations": 3
    },
    {
        "input": "Search for recent AI news",
        "expected_tool_calls": ["search"],
        "max_iterations": 5
    },
    {
        "input": "Write and run a Python function to add 2+2",
        "expected_tool_calls": ["write_code", "run_code"],
        "expected_contains": ["4"]
    }
]

def run_evals(agent):
    results = []
    for case in EVAL_CASES:
        result = agent.run(case["input"])

        passed = True
        reasons = []

        # Check expected content
        if "expected_contains" in case:
            for expected in case["expected_contains"]:
                if expected not in result:
                    passed = False
                    reasons.append(f"Missing: {expected}")

        results.append({
            "case": case["input"],
            "passed": passed,
            "reasons": reasons
        })

    return results
```

---

## Deployment Considerations

### Configuration Management

```python
from pydantic import BaseSettings

class AgentConfig(BaseSettings):
    # LLM settings
    model: str = "claude-sonnet-4-20250514"
    temperature: float = 0.7
    max_tokens: int = 4096

    # Cost controls
    max_iterations: int = 50
    max_tokens_per_session: int = 200000
    daily_budget_usd: float = 100.0

    # Security
    allowed_tools: list[str] = ["search", "read_file"]
    blocked_domains: list[str] = []

    # Observability
    log_level: str = "INFO"
    enable_tracing: bool = True

    class Config:
        env_prefix = "AGENT_"  # AGENT_MODEL, AGENT_MAX_ITERATIONS, etc.
```

### Health Checks

```python
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.get("/health")
def health_check():
    """Basic health check."""
    return {"status": "healthy"}

@app.get("/health/deep")
def deep_health_check():
    """Check all dependencies."""

    checks = {}

    # Check LLM API
    try:
        client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=10,
            messages=[{"role": "user", "content": "Hi"}]
        )
        checks["llm_api"] = "healthy"
    except Exception as e:
        checks["llm_api"] = f"unhealthy: {e}"

    # Check database
    try:
        db.ping()
        checks["database"] = "healthy"
    except Exception as e:
        checks["database"] = f"unhealthy: {e}"

    # Overall status
    all_healthy = all(v == "healthy" for v in checks.values())

    if not all_healthy:
        raise HTTPException(status_code=503, detail=checks)

    return {"status": "healthy", "checks": checks}
```

---

## Things to Remember

1. **Plan for failure** : Everything can go wrong; handle it gracefully
2. **Log everything** : You can't fix what you can't see
3. **Control costs** : Set hard limits before they matter
4. **Secure by default** : Validate inputs, control permissions
5. **Test comprehensively** : Unit, integration, and evals
6. **Monitor in production** : Metrics, alerts, dashboards

---

## Final Checklist

Before going live:

- [ ] All error paths handled
- [ ] Retry logic implemented
- [ ] Logging captures key events
- [ ] Token/cost limits set
- [ ] Input validation active
- [ ] Tool permissions configured
- [ ] Tests passing
- [ ] Health checks working
- [ ] Monitoring/alerting set up
- [ ] Runbook for common issues

---

**Congratulations!** You've completed the Building Agents module. You now have the knowledge to build, test, and deploy production-grade AI agents.

**Go back to:** [../README.md](../README.md) : Main AI Skills index
