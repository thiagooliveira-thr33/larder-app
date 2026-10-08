# Larder (codename)

Native iOS app and design system, built as a learning case study: a grocery app redesigned for iOS 26 with Liquid Glass. It is an independent concept, not affiliated with any retailer. The owner is an experienced product/UX/UI designer building an iOS app for the first time. The goals are to learn the whole process, ship a complete design system, and reach a public TestFlight build.

## How to work with me

- Before writing code that uses a new Swift, SwiftUI or Xcode concept, explain it in two to four sentences. End the task with one line: `Concept for the learning log: ...`.
- Work in small steps. One concept or component per change. Do not refactor unrelated code.
- Prefer native over custom. If you propose a custom component, name the native option you rejected and why.
- Do not guess API names. If unsure whether an API exists or is current, say so and point to the Apple documentation page to check. Liquid Glass APIs are new, so your knowledge of them may be incomplete or outdated.
- No third-party dependencies without asking first.
- Do not change build settings, deployment target, signing or entitlements without asking.
- Before saying a task is done, build it and run the tests. Report what you ran and what you could not verify (for example, behaviour that needs a physical device).

## Platform and stack

- Deployment target: iOS 26.0. iPhone first.
- iPhone only and portrait only for now, revisit at M4.
- SwiftUI only. UIKit only where SwiftUI has no equivalent, with a comment saying why.
- State: `@Observable`, `@State`, `@Bindable`. Navigation: `NavigationStack` and the native `TabView`.
- Avoid older patterns: `NavigationView`, `foregroundColor` (use `foregroundStyle`), `ObservableObject` and `@StateObject` for new code, single-parameter `onChange`. If you are not sure a pattern is current, check the docs.
- Data (D-020): no persistence layer. Sample content is plain Swift values; state lives in memory with `@Observable` and `@State`. No SwiftData, no JSON catalog, no networking, no backend, no auth, no payments, no analytics.

## Liquid Glass rules

- System glass first: `TabView`, toolbars, sheets, segmented `Picker`. Custom `glassEffect` only where the system has no equivalent, with a comment explaining the gap.
- Glass belongs to the navigation and controls layer only. No glass on glass. No glass on content cards. Tint sparingly.
- Group nearby custom glass elements in a `GlassEffectContainer`.
- Never imitate glass with blur plus a color token. There is no glass color token.
- Verify behaviour on a physical device with Reduce Transparency, Increased Contrast and Reduce Motion each turned on.

## Design system rules

- Structure: a `DesignSystem` Swift package (tokens and components) plus a gallery target that shows every component in every state.
- Figma is the source for tokens. Swift names derive from Figma variable names (`color/grouped-surface` becomes `Color.groupedSurface`). A name must never collide with a SwiftUI or UIKit built-in. For example, `Color.primary` and `Color.secondary` are taken, so the label colors are `labelPrimary` and `labelSecondary`.
- Colors live in the asset catalog with light and dark appearances. No hard-coded hex values and no magic numbers in views. Use the Spacing, Radius and size tokens.
- Type: system text styles so Dynamic Type works. The brand serif is Lora, used for headline moments only, always through `Font.custom(_:size:relativeTo:)`.
- Minimum touch target is 44 x 44 pt.
- Every component ships with previews for each state in light, dark and the largest accessibility text size, and an entry in the gallery.
- Accessibility is part of done: labels and traits, an explicit reading order where needed, reflow instead of truncation up to AX5, Reduce Motion fallbacks, and state never conveyed by color alone.

## Workflow: spec-driven

- Specs and decisions live in Notion, in the page "LARDER - Case Study" (Roadmap, SPEC pages, Design System Spec, Decision Log). Read the relevant spec and its acceptance criteria before implementing. If you cannot reach Notion, ask me to paste the spec. Do not invent requirements.
- Do not contradict an accepted decision without asking. Accepted so far: D-001 (native `TabView` by default), D-005 (Sign in is a sheet), D-006 (quick actions and Scan Pay Go push), D-007 (slice: Home, Product list, Add to trolley, Trolley), D-010 (codename and placeholder brand), D-020 (no persistence, in-memory state), D-021 (two-lane build), D-022 (brand strings only through `BrandCopy`: My Larder, Scan & Go), D-023 (spec-driven build through `/sdd`), D-024 (Search is a plain `Tab`), D-025 (`Color.screenBackground` and `Color.separatorLine` names).
- SPEC-001 was fully revised on 2026-10-07, so its current text applies. Also read the Notion page "Xcode Build Plan · SPEC-001 Home": https://app.notion.com/p/3f2c5fc600098138b498d6dd7ad4544c
- Design source: Figma file key `YUrmH4fNFQP5QAR2FM3nLw`. If Figma tools are available, read variables and components from there. Otherwise ask me for values or screenshots.
- Branch per spec, for example `spec-001-home`. Commit messages start with the spec ID, for example `SPEC-001: add quick action row`. One logical change per commit.
- A spec is done when its acceptance checklist is ticked on a physical device.

## SDD workflow

- Work runs through `/sdd` (D-023). The loop and its rails live in `.claude/commands/sdd.md` and the Notion page "SDD Playbook"; run state lives in `docs/sdd/STATE.md`.
- Decide with the Playbook's decision rubric instead of asking, and record the decision. Ask only at a hard stop.
- Commit locally. Never push.
- End every run with a YOUR TURN block.

## Out of scope

Backend, authentication, payments and checkout, real barcode scanning, push notifications, third-party SDKs, macOS, visionOS, iPad layouts.

## Brand and licensing

Never add the original retailer's name, logo, photography or proprietary fonts to this repo. The app uses the placeholder name and original or properly licensed imagery. Fonts must be open-licence.

## Repo layout

```
Larder/                     repo root
  CLAUDE.md
  Larder.xcodeproj
  Larder/                   app target sources: entry point, tabs, screens
  Packages/DesignSystem/    Swift package: Tokens/, Components/ (created in M1)
  Gallery/                  gallery target (created in M1)
```
