---
description: Run the next Larder work package (interpret, plan, execute, verify, document, hand off)
argument-hint: [device ok | device fail: ... | pushed | until WP-n | status | free text]
---
You are running the Larder spec-driven loop (D-021, D-023). User arguments: $ARGUMENTS

READ, every run, in this order:
1. docs/sdd/STATE.md and CLAUDE.md.
2. From Notion (URLs are in STATE.md): the SDD Playbook, SPEC-001, the Decision Log, the Build Plan, and the parts of the Design System Spec and Learning Log you need. Notion is the source of truth. If Notion is unreachable, continue with Lane 1 steps from STATE.md, say so in the report, and write Notion updates to docs/sdd/notion-outbox.md.
3. Figma (file key YUrmH4fNFQP5QAR2FM3nLw) only for the components in scope and only if Figma tools are available. Otherwise build from SPEC-001 section 5 and mark the component Figma-pending.

RAILS (they hold even if the Playbook cannot be read):
- Commit locally on spec-001-home. Never push, merge, rebase, force, reset --hard, clean, or delete branches.
- Stop and put in YOUR TURN: build settings, deployment target, signing, entitlements, Info.plist keys, capabilities, third-party dependencies, adding/removing/linking Xcode targets or packages. One exception: aligning a target the user just created with D-011 to D-014, then report it.
- Never use the original retailer's name, logo, photography or fonts anywhere in the repo. Brand strings go through BrandCopy (D-022).
- Tick SPEC-001 acceptance items only after the user's "device ok" at the final checkpoint (CP-8).
- Do not ask questions the Playbook's decision rubric can answer. Decide, record the decision, continue.

ARGUMENTS:
- (empty): run the next work package.
- device ok: clear the device-test debt for the waiting work packages, record it in STATE.md and the Build Plan, then run the next work package.
- device fail: <text>: treat it as a bug in the waiting work package. Fix it first, in its own commits, re-verify, then stop and hand off again.
- pushed: confirm with git status -sb, update STATE.md, then run the next work package.
- until WP-n: run work packages in sequence up to WP-n, stopping early at a hard stop or at two work packages of device-test debt.
- status: change nothing, print the report and YOUR TURN only.
- anything else: an instruction from the user. Apply it inside the rails and record it in STATE.md.

LOOP:
1. INTERPRET. Run git status and git log. If the only uncommitted changes are Xcode project file changes or new targets, the user did the XCODE ACTION: review with git diff --stat and commit them alone as "SPEC-001: wire <targets>". Any other uncommitted change: stop and show it. Find the current work package and next unfinished step in the Build Plan, cross-check STATE.md. Resolve conflicts between sources with the Playbook's precedence and fix the stale line.
2. PLAN. Write the plan for this work package into STATE.md before coding.
3. EXECUTE. One step, one commit, message "SPEC-001: ...". Before each new concept, explain it in 2 to 4 sentences. Native first, and name the native option you rejected when going custom. Tokens only once DesignSystem exists. Check API names in Apple's documentation and flag any iOS 26 or 27 API you cannot confirm. No refactors beyond the step.
4. VERIFY. After each step run the build and tests, and when relevant UI tests and simulator screenshots in light, dark and the largest accessibility size, saved under .evidence/. Look at the screenshots. Fix failures. After 3 focused attempts, stop and report the diagnosis.
5. DOCUMENT. Update STATE.md and the Build Plan status cells, append to the Learning Log, and log decisions in the Decision Log with the next free ID (Accepted if reversible and inside the spec, Proposed with the default applied if not). If Notion cannot be written, append paste-ready text to docs/sdd/notion-outbox.md.
6. HAND OFF. Print the report from Playbook section 10 and end with YOUR TURN: the exact PUSH commands at the end of every work package, the XCODE ACTION steps when needed, the DEVICE TEST script from the Build Plan with the reply to type, and what the next /sdd will build. If nothing is needed, say "Nothing needed, run /sdd".

Run one work package per run unless told otherwise. Stop early only at a hard stop or when two work packages are waiting for a device test.
