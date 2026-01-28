# API Documentation

## Why Documentation Matters

The best API with bad docs fails. The mediocre API with great docs succeeds.

Documentation is your API's user interface for developers.

---

## What to Document

### Essential Elements

1. **Getting Started** - First API call in under 5 minutes
2. **Authentication** - How to get and use credentials
3. **Endpoints** - Every path, method, parameter
4. **Examples** - Request/response for each endpoint
5. **Errors** - Every error code and what to do
6. **Rate Limits** - Limits and how to handle them

### Nice to Have

7. **SDKs** - Client libraries for popular languages
8. **Changelog** - What's new, deprecated, removed
9. **Tutorials** - Common use case walkthroughs
10. **Playground** - Interactive API testing

---

## OpenAPI (Swagger)

The industry standard for API documentation.

### Basic Structure

```yaml
openapi: 3.0.0
info:
  title: Users API
  version: 1.0.0
  description: Manage user accounts

servers:
  - url: https://api.example.com/v1

paths:
  /users:
    get:
      summary: List all users
      parameters:
        - name: limit
          in: query
          schema:
            type: integer
            default: 20
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'

components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: integer
        email:
          type: string
          format: email
        name:
          type: string
```

### Benefits

- Auto-generate documentation UI (Swagger UI, Redoc)
- Generate client SDKs
- Validate requests/responses
- Keep docs in sync with code

---

## Writing Good Examples

### Before and After

**Bad example:**
```
GET /users
Returns users.
```

**Good example:**
```bash
# Request
curl -X GET "https://api.example.com/v1/users?limit=2" \
  -H "Authorization: Bearer sk_test_abc123"

# Response (200 OK)
{
  "data": [
    {
      "id": 1,
      "email": "jane@example.com",
      "name": "Jane Doe",
      "createdAt": "2026-01-15T10:30:00Z"
    },
    {
      "id": 2,
      "email": "john@example.com",
      "name": "John Smith",
      "createdAt": "2026-01-20T14:45:00Z"
    }
  ],
  "meta": {
    "total": 150,
    "limit": 2,
    "offset": 0
  }
}
```

### Example Checklist

- [ ] Shows full request (URL, headers, body)
- [ ] Shows full response (status, body)
- [ ] Uses realistic data
- [ ] Includes error examples
- [ ] Provides copy-paste ready code

---

## Code Examples in Multiple Languages

```python
# Python
import requests

response = requests.get(
    "https://api.example.com/v1/users",
    headers={"Authorization": "Bearer sk_test_abc123"}
)
users = response.json()
```

```javascript
// JavaScript (Node.js)
const response = await fetch("https://api.example.com/v1/users", {
  headers: { "Authorization": "Bearer sk_test_abc123" }
});
const users = await response.json();
```

```bash
# cURL
curl -X GET "https://api.example.com/v1/users" \
  -H "Authorization: Bearer sk_test_abc123"
```

---

## Getting Started Guide Template

```markdown
# Getting Started

## 1. Get Your API Key

Sign up at [dashboard.example.com](https://dashboard.example.com)
and create an API key.

## 2. Make Your First Request

```bash
curl -X GET "https://api.example.com/v1/users/me" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## 3. Explore the API

- [List users](/docs/users#list)
- [Create user](/docs/users#create)
- [Full API reference](/docs/reference)

## 4. Need Help?

- [Common errors](/docs/errors)
- [Rate limits](/docs/rate-limits)
- [Contact support](mailto:support@example.com)
```

---

## Documenting for AI Agents

When AI agents will call your API, descriptions matter more:

```yaml
# Good tool description for AI
paths:
  /search:
    post:
      summary: Search for products
      description: |
        Search the product catalog by keyword, category, or filters.
        Returns up to 20 results by default.

        Use this when the user wants to find products.
        Do NOT use this for checking inventory (use /inventory instead).
      parameters:
        - name: query
          description: |
            The search query. Can be product name, description keywords,
            or category. Examples: "blue running shoes", "laptop under $500"
```

### AI-Specific Tips

1. **Be explicit** - LLMs read descriptions literally
2. **Provide examples** - Help the model understand formats
3. **Say what NOT to do** - Prevent common misuse
4. **Keep it concise** - Long descriptions = more tokens

---

## Documentation Tools

| Tool | Type | Best For |
|------|------|----------|
| **Swagger UI** | OpenAPI renderer | Quick API docs |
| **Redoc** | OpenAPI renderer | Beautiful docs |
| **Readme.com** | Full platform | Developer portals |
| **GitBook** | Docs platform | Guides + reference |
| **Docusaurus** | Static site | Custom docs sites |
| **Postman** | API platform | Interactive docs |

---

## Common Mistakes

### 1. Outdated Examples

```
BAD: Example shows deprecated field
GOOD: Automated tests verify examples still work
```

### 2. Missing Error Cases

```
BAD: Only shows success response
GOOD: Shows 400, 401, 404, 500 responses too
```

### 3. No Getting Started

```
BAD: Jumps straight to API reference
GOOD: "First API call in 5 minutes" tutorial
```

### 4. Wrong Environment

```
BAD: Examples use production URLs
GOOD: Examples use sandbox/test environment
```

---

## Documentation Checklist

**Structure:**
- [ ] Getting started guide exists
- [ ] Authentication explained clearly
- [ ] All endpoints documented
- [ ] Changelog maintained

**Quality:**
- [ ] Examples are copy-paste ready
- [ ] Error codes documented
- [ ] Multiple language examples
- [ ] Rate limits explained

**Maintenance:**
- [ ] Docs deploy with code
- [ ] Examples tested automatically
- [ ] Feedback mechanism exists
- [ ] Deprecation warnings shown

---

## Next Steps

- **API fundamentals:** [01-Fundamentals.md](01-Fundamentals.md)
- **Error handling:** [02-Error-Handling.md](02-Error-Handling.md)
- **Back to index:** [00-Index.md](00-Index.md)

---

*Documentation is a product. Treat it like one.*
