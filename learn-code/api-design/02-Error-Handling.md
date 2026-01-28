# API Error Handling

## Why Error Handling Matters

Good errors help developers debug quickly. Bad errors waste time and create frustration.

```
BAD:  {"error": "Something went wrong"}
GOOD: {"error": {"code": "INVALID_EMAIL", "message": "Email format is invalid", "field": "email"}}
```

---

## HTTP Status Codes

### Success (2xx)

| Code | Name | When to Use |
|------|------|-------------|
| **200** | OK | Successful GET, PUT, PATCH |
| **201** | Created | Successful POST that creates resource |
| **204** | No Content | Successful DELETE |

### Client Errors (4xx)

| Code | Name | When to Use |
|------|------|-------------|
| **400** | Bad Request | Invalid syntax, malformed JSON |
| **401** | Unauthorized | Missing or invalid authentication |
| **403** | Forbidden | Authenticated but not allowed |
| **404** | Not Found | Resource doesn't exist |
| **409** | Conflict | Resource state conflict (e.g., duplicate) |
| **422** | Unprocessable Entity | Valid syntax but semantic errors |
| **429** | Too Many Requests | Rate limit exceeded |

### Server Errors (5xx)

| Code | Name | When to Use |
|------|------|-------------|
| **500** | Internal Server Error | Unexpected server failure |
| **502** | Bad Gateway | Upstream service failure |
| **503** | Service Unavailable | Temporary overload or maintenance |
| **504** | Gateway Timeout | Upstream service timeout |

---

## Error Response Format

### Standard Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "The request contains invalid data",
    "details": [
      {
        "field": "email",
        "code": "INVALID_FORMAT",
        "message": "Email must be a valid email address"
      },
      {
        "field": "age",
        "code": "OUT_OF_RANGE",
        "message": "Age must be between 0 and 150"
      }
    ]
  }
}
```

### Required Fields

| Field | Purpose | Example |
|-------|---------|---------|
| `code` | Machine-readable error type | `VALIDATION_ERROR` |
| `message` | Human-readable description | `"The request contains invalid data"` |

### Optional Fields

| Field | Purpose | Example |
|-------|---------|---------|
| `details` | Specific field errors | `[{"field": "email", ...}]` |
| `requestId` | For debugging/support | `"req_abc123"` |
| `documentation` | Link to docs | `"https://docs.api.com/errors/VALIDATION_ERROR"` |

---

## Error Code Design

### Use Specific, Actionable Codes

```
BAD:
- ERROR
- INVALID
- FAILED

GOOD:
- INVALID_EMAIL_FORMAT
- USER_NOT_FOUND
- RATE_LIMIT_EXCEEDED
- INSUFFICIENT_PERMISSIONS
- DUPLICATE_RESOURCE
```

### Organize by Category

```
Authentication:
- AUTH_REQUIRED
- AUTH_INVALID_TOKEN
- AUTH_EXPIRED_TOKEN

Validation:
- VALIDATION_REQUIRED_FIELD
- VALIDATION_INVALID_FORMAT
- VALIDATION_OUT_OF_RANGE

Resources:
- RESOURCE_NOT_FOUND
- RESOURCE_ALREADY_EXISTS
- RESOURCE_CONFLICT

Rate Limiting:
- RATE_LIMIT_EXCEEDED
- RATE_LIMIT_QUOTA_EXCEEDED
```

---

## Writing Good Error Messages

### For Developers

Be specific and actionable:

```
BAD:  "Invalid request"
GOOD: "The 'email' field must be a valid email address. Received: 'not-an-email'"

BAD:  "Authentication failed"
GOOD: "The API key provided has expired. Generate a new key at https://dashboard.api.com/keys"

BAD:  "Server error"
GOOD: "The database is temporarily unavailable. Please retry in 30 seconds."
```

### Security Considerations

Don't leak sensitive information:

```
BAD:  "User 'john@company.com' not found in database 'users_production'"
GOOD: "User not found"

BAD:  "Password must match: 'secret123'"
GOOD: "Invalid credentials"

BAD:  "SQL Error: SELECT * FROM users WHERE id = 123"
GOOD: "An internal error occurred. Please try again."
```

---

## Common Patterns

### Validation Errors

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": [
      {
        "field": "email",
        "code": "REQUIRED",
        "message": "Email is required"
      },
      {
        "field": "password",
        "code": "TOO_SHORT",
        "message": "Password must be at least 8 characters"
      }
    ]
  }
}
```

### Authentication Errors

```json
{
  "error": {
    "code": "AUTH_INVALID_TOKEN",
    "message": "The provided access token is invalid or has expired",
    "documentation": "https://docs.api.com/authentication"
  }
}
```

### Rate Limiting

```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests. Please wait before trying again.",
    "retryAfter": 30
  }
}
```

Include `Retry-After` header too.

### Not Found

```json
{
  "error": {
    "code": "USER_NOT_FOUND",
    "message": "No user found with ID '123'"
  }
}
```

---

## AI Tool Errors

For AI agents calling your API, errors should be:

1. **Self-explanatory** - The LLM should understand what went wrong
2. **Actionable** - Guide the agent to fix the issue
3. **Not misleading** - Don't cause the agent to hallucinate

```json
// Good AI-friendly error
{
  "error": {
    "code": "INVALID_DATE_FORMAT",
    "message": "The date '2026-13-45' is invalid. Use YYYY-MM-DD format (e.g., '2026-01-28').",
    "example": "2026-01-28"
  }
}
```

---

## Implementation Checklist

- [ ] All errors return JSON format
- [ ] Status codes match error types
- [ ] Error codes are specific and consistent
- [ ] Messages are helpful but not leaky
- [ ] Validation errors include field details
- [ ] Rate limits include retry information
- [ ] Request IDs included for debugging
- [ ] 5xx errors don't expose internals

---

## Next Steps

- **Authentication:** [03-Authentication.md](03-Authentication.md)
- **Documentation:** [04-Documentation.md](04-Documentation.md)
- **Back to index:** [00-Index.md](00-Index.md)

---

*A good error message is worth a thousand support tickets.*
