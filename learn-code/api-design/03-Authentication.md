# API Authentication

## Why Authentication Matters

Authentication answers: "Who are you?" Authorization answers: "What can you do?"

Both are critical for any API beyond simple public data.

---

## Common Auth Methods

### 1. API Keys

**What it is:** A simple token passed with each request.

```
GET /users HTTP/1.1
Authorization: Bearer sk_live_abc123xyz
```

Or as query parameter (less secure):
```
GET /users?api_key=sk_live_abc123xyz
```

**Pros:**
- Simple to implement
- Easy for developers to use
- Good for server-to-server

**Cons:**
- No user context
- Hard to revoke at scale
- Can be leaked easily

**Best for:** Server-to-server APIs, simple integrations

---

### 2. OAuth 2.0

**What it is:** A framework for delegated authorization.

```
┌─────────────────────────────────────────────────────────────┐
│ OAUTH 2.0 FLOW (Authorization Code)                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. User clicks "Login with Google"                        │
│                    ↓                                        │
│  2. Redirect to Google login page                          │
│                    ↓                                        │
│  3. User approves access                                   │
│                    ↓                                        │
│  4. Google redirects back with auth code                   │
│                    ↓                                        │
│  5. Your server exchanges code for tokens                  │
│                    ↓                                        │
│  6. Use access_token for API calls                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Pros:**
- Industry standard
- Scoped permissions
- Refresh tokens for long sessions
- Doesn't expose user credentials

**Cons:**
- Complex to implement
- Multiple flows to understand
- Token management overhead

**Best for:** User-facing applications, third-party integrations

---

### 3. JWT (JSON Web Tokens)

**What it is:** Self-contained, signed tokens with embedded claims.

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJzdWIiOiIxMjMiLCJuYW1lIjoiSmFuZSIsImlhdCI6MTUxNjIzOTAyMn0.
SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

**Structure:**
```json
// Header
{"alg": "HS256", "typ": "JWT"}

// Payload
{
  "sub": "123",
  "name": "Jane Doe",
  "role": "admin",
  "iat": 1516239022,
  "exp": 1516242622
}

// Signature
HMACSHA256(header + payload, secret)
```

**Pros:**
- Stateless (no database lookup)
- Contains user info
- Can be verified without API call

**Cons:**
- Can't be revoked easily
- Payload is readable (base64)
- Size grows with claims

**Best for:** Microservices, stateless APIs

---

### 4. Session-Based (Cookies)

**What it is:** Server stores session, client gets cookie.

```
Set-Cookie: session_id=abc123; HttpOnly; Secure; SameSite=Strict
```

**Pros:**
- Simple mental model
- Easy to revoke
- Works well with browsers

**Cons:**
- Requires server-side storage
- CSRF vulnerabilities
- Harder for mobile/SPAs

**Best for:** Traditional web apps, browser-first products

---

## Choosing an Auth Method

```
┌─────────────────────────────────────────────────────────────┐
│ DECISION TREE                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Who's calling your API?                                    │
│                                                             │
│  → Server-to-server only?                                  │
│      → API Keys (simple)                                   │
│      → OAuth Client Credentials (if scopes needed)         │
│                                                             │
│  → Users via browser/mobile?                               │
│      → OAuth 2.0 + JWTs (modern best practice)            │
│      → Sessions (traditional web apps)                     │
│                                                             │
│  → Third-party developers?                                 │
│      → OAuth 2.0 (delegated access, scopes)               │
│                                                             │
│  → AI agents calling your API?                             │
│      → API Keys (simple, per-agent)                        │
│      → OAuth if user context needed                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Implementation Best Practices

### API Key Security

```
DO:
- Use environment variables, never hardcode
- Prefix with environment (sk_live_, sk_test_)
- Store hashed, not plaintext
- Allow multiple keys per user
- Support key rotation

DON'T:
- Log full API keys
- Pass in URLs (use headers)
- Use short keys (min 32 chars)
- Skip rate limiting
```

### JWT Best Practices

```
DO:
- Use short expiration (15 min - 1 hour)
- Implement refresh tokens
- Validate signature on every request
- Use RS256 for multi-service
- Include only necessary claims

DON'T:
- Store sensitive data in payload
- Use HS256 with weak secrets
- Skip expiration validation
- Trust without verification
```

### Token Storage (Client-Side)

| Location | Security | Notes |
|----------|----------|-------|
| **HttpOnly Cookie** | High | Best for browsers, immune to XSS |
| **localStorage** | Low | Vulnerable to XSS |
| **sessionStorage** | Low | Vulnerable to XSS, clears on close |
| **Memory** | High | Lost on refresh, good for SPAs |

---

## Rate Limiting

Always combine auth with rate limiting:

```
Headers:
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

Rate limit by:
- API key
- User ID
- IP address (fallback)

---

## For AI Agents

When AI agents call your API:

1. **Use dedicated API keys** - One key per agent/integration
2. **Scope permissions** - Only grant what's needed
3. **Track usage** - Monitor tokens, costs, calls
4. **Plan for revocation** - Agents can be compromised

```json
// Example: AI agent API key with scopes
{
  "key": "sk_agent_abc123",
  "name": "Customer Support Agent",
  "scopes": ["read:customers", "read:orders"],
  "rateLimit": 100,
  "expiresAt": "2026-12-31T23:59:59Z"
}
```

---

## Security Checklist

- [ ] Secrets never in code or logs
- [ ] HTTPS only (no HTTP)
- [ ] Tokens expire
- [ ] Rate limiting enabled
- [ ] Failed attempts logged
- [ ] Keys can be revoked
- [ ] Scopes limit access
- [ ] CORS configured correctly

---

## Next Steps

- **Documentation:** [04-Documentation.md](04-Documentation.md)
- **Error handling:** [02-Error-Handling.md](02-Error-Handling.md)
- **Back to index:** [00-Index.md](00-Index.md)

---

*Security is not a feature—it's a requirement.*
