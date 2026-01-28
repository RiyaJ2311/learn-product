# API Design Fundamentals

## What Makes a Good API?

A good API is:
- **Intuitive** - Developers can guess how to use it
- **Consistent** - Patterns apply everywhere
- **Forgiving** - Hard to misuse, helpful when you do
- **Documented** - Self-describing with clear examples

---

## REST Principles

REST (Representational State Transfer) isn't a strict standard—it's a set of architectural principles.

### Resources, Not Actions

Think nouns, not verbs:

```
BAD:  GET /getUser/123
GOOD: GET /users/123

BAD:  POST /createOrder
GOOD: POST /orders

BAD:  DELETE /removeItem/456
GOOD: DELETE /items/456
```

### HTTP Methods Have Meaning

| Method | Purpose | Idempotent? | Example |
|--------|---------|-------------|---------|
| **GET** | Retrieve | Yes | `GET /users/123` |
| **POST** | Create | No | `POST /users` |
| **PUT** | Replace | Yes | `PUT /users/123` |
| **PATCH** | Update | No* | `PATCH /users/123` |
| **DELETE** | Remove | Yes | `DELETE /users/123` |

*PATCH can be idempotent depending on implementation.

### Status Codes Tell the Story

| Range | Meaning | Common Codes |
|-------|---------|--------------|
| **2xx** | Success | 200 OK, 201 Created, 204 No Content |
| **4xx** | Client Error | 400 Bad Request, 401 Unauthorized, 404 Not Found |
| **5xx** | Server Error | 500 Internal Error, 503 Service Unavailable |

---

## Naming Conventions

### URL Structure

```
┌─────────────────────────────────────────────────────────────┐
│ URL ANATOMY                                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  /users                    → Collection of users            │
│  /users/123                → Specific user                  │
│  /users/123/orders         → User's orders (nested)        │
│  /users/123/orders/456     → Specific order for user       │
│                                                             │
│  QUERY PARAMETERS                                           │
│  ────────────────                                           │
│  /users?status=active      → Filter                        │
│  /users?sort=created_at    → Sort                          │
│  /users?limit=10&offset=20 → Pagination                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Naming Rules

1. **Use plural nouns:** `/users` not `/user`
2. **Use lowercase:** `/users` not `/Users`
3. **Use hyphens for multi-word:** `/user-profiles` not `/user_profiles`
4. **No verbs in URLs:** `/users` not `/getUsers`
5. **No file extensions:** `/users/123` not `/users/123.json`

---

## Request/Response Design

### Request Bodies

```json
// POST /users
{
  "email": "user@example.com",
  "name": "Jane Doe",
  "role": "admin"
}
```

**Best practices:**
- Use camelCase for field names
- Make required fields obvious
- Validate early, fail fast

### Response Bodies

```json
// GET /users/123
{
  "id": 123,
  "email": "user@example.com",
  "name": "Jane Doe",
  "role": "admin",
  "createdAt": "2026-01-28T10:30:00Z",
  "updatedAt": "2026-01-28T10:30:00Z"
}
```

**Best practices:**
- Always include `id`
- Use ISO 8601 for dates
- Include timestamps (`createdAt`, `updatedAt`)
- Wrap collections: `{ "data": [...], "meta": {...} }`

---

## Pagination

For collections, always paginate:

### Offset-Based

```
GET /users?limit=20&offset=40

Response:
{
  "data": [...],
  "meta": {
    "total": 150,
    "limit": 20,
    "offset": 40
  }
}
```

### Cursor-Based (Better for Large Data)

```
GET /users?limit=20&cursor=abc123

Response:
{
  "data": [...],
  "meta": {
    "nextCursor": "def456",
    "hasMore": true
  }
}
```

---

## Filtering and Sorting

### Filtering

```
GET /users?status=active
GET /users?role=admin&status=active
GET /users?created_after=2026-01-01
```

### Sorting

```
GET /users?sort=created_at          # Ascending (default)
GET /users?sort=-created_at         # Descending (prefix with -)
GET /users?sort=name,-created_at    # Multiple fields
```

---

## Versioning

APIs evolve. Plan for it.

### URL Versioning (Most Common)

```
/v1/users
/v2/users
```

**Pros:** Explicit, easy to understand
**Cons:** URL clutter, harder to deprecate

### Header Versioning

```
GET /users
Accept: application/vnd.api+json; version=1
```

**Pros:** Clean URLs
**Cons:** Less visible, harder to test

### Recommendation

Start with URL versioning (`/v1/`). It's explicit and easy to manage.

---

## AI Tool Design Connection

These principles apply directly to AI tool schemas:

```
┌─────────────────────────────────────────────────────────────┐
│ API DESIGN → AI TOOL DESIGN                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  REST API DESIGN                                            │
│  ───────────────                                            │
│  - Clear resource names                                     │
│  - Consistent parameters                                    │
│  - Good error messages                                      │
│  - Self-documenting                                         │
│                                                             │
│  AI TOOL DESIGN                                             │
│  ──────────────                                             │
│  - Clear tool names                                         │
│  - Well-defined input schemas                               │
│  - Helpful error responses                                  │
│  - Good descriptions (LLM reads these!)                     │
│                                                             │
│  Same principles, different consumer                        │
│  (Humans → LLMs)                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**See:** [AI Tool Calling](../../08-AI-Skills/03-AI-Agents/03-Tool-Calling.md)

---

## Common Mistakes

### 1. Inconsistent Naming

```
BAD:
GET /users/123
GET /order/456        # Should be /orders/456
GET /get-products     # Should be /products
```

### 2. Wrong Status Codes

```
BAD:
POST /users → 200 OK            # Should be 201 Created
DELETE /users/123 → 200 OK      # Should be 204 No Content
```

### 3. Exposing Internal Details

```
BAD:
{
  "error": "SQLException: Column 'user_id' not found"
}

GOOD:
{
  "error": {
    "code": "INVALID_REQUEST",
    "message": "The requested user was not found"
  }
}
```

---

## Checklist

Before shipping an API:

- [ ] Resources use plural nouns
- [ ] HTTP methods match intent
- [ ] Status codes are correct
- [ ] Naming is consistent
- [ ] Pagination exists for collections
- [ ] Errors are informative (not leaky)
- [ ] Documentation exists
- [ ] Versioning strategy decided

---

## Next Steps

- **Error handling:** [02-Error-Handling.md](02-Error-Handling.md)
- **Authentication:** [03-Authentication.md](03-Authentication.md)
- **Documentation:** [04-Documentation.md](04-Documentation.md)
- **AI tools:** [Tool Calling](../../08-AI-Skills/03-AI-Agents/03-Tool-Calling.md)

---

*The best API is one you don't need to read documentation to use—but you're glad the documentation exists.*
