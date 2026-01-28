# Verification Habits

**Core Principle:** Verify your work is live. Check experiments are actually running.

---

## The Problem

PMs often assume their work is live and working, but:
- Experiments aren't actually running
- Features aren't deployed correctly
- Metrics aren't tracking properly
- Users aren't seeing changes

**Bad Pattern:**
> "The experiment should be live. Let me check the metrics."

**Good Pattern:**
> "The experiment is live. I verified it's running, checked the metrics are tracking, and confirmed users are seeing it."

---

## The Framework

### Step 1: Verify Before Assuming
Before assuming something is working, verify:
- Is it actually live?
- Is it working correctly?
- Are metrics tracking?
- Are users seeing it?

### Step 2: Check Multiple Signals
Don't rely on one signal:
- Check the system (is it deployed?)
- Check the metrics (are they tracking?)
- Check user behavior (are users seeing it?)
- Check logs/errors (are there issues?)

### Step 3: Verify Regularly
Don't verify once and forget:
- Verify immediately after launch
- Verify periodically during experiment
- Verify before making decisions
- Verify after changes

---

## Examples

### Example 1: Experiment Launch

**Bad:**
> "The experiment launched. Let me check metrics tomorrow."

**Good:**
> "The experiment launched. I verified:
> - Experiment is running in the system ✓
> - Metrics are tracking correctly ✓
> - Users are being assigned to variants ✓
> - No errors in logs ✓
> 
> I'll check metrics again in 24 hours."

---

### Example 2: Feature Deployment

**Bad:**
> "The feature is deployed. Users should see it."

**Good:**
> "The feature is deployed. I verified:
> - Feature is live in production ✓
> - Users can access it ✓
> - Metrics are tracking ✓
> - No support tickets about issues ✓
> 
> I'll monitor for 48 hours."

---

### Example 3: Metric Tracking

**Bad:**
> "The metric should be tracking. Let me check the dashboard."

**Good:**
> "The metric is tracking. I verified:
> - Events are firing correctly ✓
> - Data is flowing to dashboard ✓
> - Numbers look reasonable ✓
> - No gaps in data ✓
> 
> I'll check weekly."

---

## Practice Questions

Before assuming something is working, ask:
- [ ] Have I verified this is live?
- [ ] Have I checked multiple signals?
- [ ] Have I verified it's working correctly?
- [ ] Will I verify regularly?

---

## Common Mistakes

### Mistake 1: Assuming It's Working
**Problem:** Assuming without verifying.
**Fix:** Always verify before assuming.

### Mistake 2: Single Signal Verification
**Problem:** Checking only one signal (e.g., metrics).
**Fix:** Check multiple signals (system, metrics, users, logs).

### Mistake 3: One-Time Verification
**Problem:** Verifying once and forgetting.
**Fix:** Verify regularly, especially after changes.

### Mistake 4: Not Verifying Before Decisions
**Problem:** Making decisions without verifying data is accurate.
**Fix:** Verify data before making decisions.

---

## Verification Checklist

For any launch or change, verify:

**System:**
- [ ] Is it deployed?
- [ ] Is it running?
- [ ] Are there errors?

**Metrics:**
- [ ] Are metrics tracking?
- [ ] Is data flowing?
- [ ] Do numbers look reasonable?

**Users:**
- [ ] Are users seeing it?
- [ ] Are users using it?
- [ ] Are there support tickets?

**Logs:**
- [ ] Are there errors?
- [ ] Are there warnings?
- [ ] Is everything normal?

---

## Building the Habit

### Week 1: Awareness
- Before assuming something is working, ask: "Have I verified?"
- Note when you're about to assume
- Catch yourself and verify

### Week 2: Practice
- Force yourself to verify before every assumption
- Create verification checklists
- Self-grade: Did I verify?

### Week 3: Refinement
- Make it automatic
- Build verification into your process
- Continue self-grading

---

## Verification Schedule

**Immediate (within 1 hour):**
- After any launch or deployment
- After any experiment start
- After any metric change

**Daily (during experiments):**
- Check experiment is running
- Check metrics are tracking
- Check for errors or issues

**Weekly (for ongoing work):**
- Review metrics accuracy
- Check for data gaps
- Verify user behavior matches expectations

**Before Decisions:**
- Verify data is accurate
- Verify experiments are running
- Verify assumptions are valid

---

## Advanced: Multi-Signal Verification

For important launches, verify across multiple signals:

**Signal 1: System**
- Deployment status
- Error logs
- System health

**Signal 2: Metrics**
- Tracking accuracy
- Data flow
- Number reasonableness

**Signal 3: Users**
- User behavior
- Support tickets
- User feedback

**Signal 4: Business**
- Business metrics
- Revenue impact
- Strategic alignment

---

## Next Steps

1. **Practice today:** Before your next assumption, verify it
2. **Self-grade:** After each verification
3. **Review:** Combine with `01-Permissionless.md` and `02-Metric-Ownership.md`

---

**Remember:** Verification prevents problems. Problems prevent impact.
