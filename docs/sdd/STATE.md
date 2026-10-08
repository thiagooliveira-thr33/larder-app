# SDD state

Memory between `/sdd` runs. Derived from Notion and git, and never overrides them (Playbook section 2, rank 6).

Last updated: 2026-10-08

## Links

- Case Study: https://app.notion.com/p/3edc5fc6000981559d98e01261ef94e9
- SDD Playbook: https://app.notion.com/p/3f2c5fc600098199b61fe684fd687725
- SPEC-001 Home: https://app.notion.com/p/3edc5fc6000981eeadade60fd3641a00
- Decision Log: https://app.notion.com/p/3edc5fc6000981aaa71deb024eba189b
- Build Plan: https://app.notion.com/p/3f2c5fc600098138b498d6dd7ad4544c
- Design System Spec: https://app.notion.com/p/3edc5fc60009818a9d0acc2dd08fb98a
- Roadmap: https://app.notion.com/p/3edc5fc60009819e9863d55a95980227
- Learning Log: https://app.notion.com/p/3edc5fc6000981e1b891fee00f1015dd
- Figma file key: `YUrmH4fNFQP5QAR2FM3nLw`
- GitHub: `thiagooliveira-thr33/larder-app`

## Environment

- Xcode 27.0 (27A266a). Only the iOS 27.0 simulator runtime is installed. Simulator used so far: iPhone 18 Pro, `E80BC573-921D-4BA6-B82C-7AB72BE3E245`.
- Deployment target stays iOS 26.0 (D-011). No iOS 26 runtime, so nothing has run on 26.0 yet.
- Schemes: `Larder` (shared, `Larder.xcodeproj/xcshareddata/xcschemes/Larder.xcscheme`). Targets: `Larder`, `LarderTests`.
- Tests: only `LarderTests/example()`, an empty Swift Testing placeholder.
- Build and test (works):

  ```
  xcodebuild test -project Larder.xcodeproj -scheme Larder \
    -destination 'platform=iOS Simulator,id=E80BC573-921D-4BA6-B82C-7AB72BE3E245'
  ```

- Screenshot after a build (works):

  ```
  xcrun simctl boot E80BC573-921D-4BA6-B82C-7AB72BE3E245
  xcrun simctl install E80BC573-921D-4BA6-B82C-7AB72BE3E245 <DerivedData>/Build/Products/Debug-iphonesimulator/Larder.app
  xcrun simctl launch E80BC573-921D-4BA6-B82C-7AB72BE3E245 com.thiagooliveira.larder
  xcrun simctl io E80BC573-921D-4BA6-B82C-7AB72BE3E245 screenshot .evidence/<step>/<name>.png
  xcrun simctl ui E80BC573-921D-4BA6-B82C-7AB72BE3E245 appearance dark
  ```

## Branch and commits

Branch `spec-001-home`, created from `main` at `3438d2c`.

| Commit | Step |
|---|---|
| `96e5e6a` | WP-0: align CLAUDE.md with D-020 and D-021 |
| `275cee1` | A1: five-tab shell |

## Work package status

| WP | Status |
|---|---|
| WP-0 | Done (96e5e6a) |
| WP-1 | In progress: A1 done (275cee1), A2 to A10 to do |
| WP-2 to WP-8 | To do |

## Plan for the current work package

WP-1 · Navigation skeleton (Lane 1, system styling only, no tokens). Written 2026-10-08 before coding.

| Step | Files | Concept | Tests and evidence |
|---|---|---|---|
| A2 | `Larder/Brand/BrandCopy.swift`; `ContentView.swift` uses it for the My Larder tab | Caseless enums as namespaces | L1, L2, L4 |
| A3 | Rename `ContentView` to `Larder/RootTabView.swift`; `Larder/Support/StubScreen.swift` wrapping the native `ContentUnavailableView`; every tab uses it | View composition and reuse | L1, L2, L4 |
| A4 | `Larder/Features/Home/HomeView.swift`: `NavigationStack` with a title and a scrollable placeholder | `NavigationStack` | L1, L2, L4 |
| A5 | `Larder/Navigation/HomeRoute.swift`; six `NavigationLink(value:)` rows and one `navigationDestination(for:)` | Value-based navigation (D-006) | L1, L2 (route titles test), L4 |
| A6 | `Larder/Features/Account/AccountSheet.swift`; toolbar account button opens it with `.medium` and `.large` detents | Sheets and `presentationDetents` (D-005) | L1, L2, L4 |
| A7 | `Larder/State/SessionStore.swift` (`@Observable`), created with `@State` in `LarderApp`, injected with `.environment`; button label reads Sign in or My Larder | `@Observable`, `@State`, environment (D-020) | L1, L2 (`SessionStoreTests`), L4 |
| A8 | `Larder/Features/Home/HomeSegment.swift`; segmented `Picker` switching two placeholders in place | `Picker`, bindings, enums (D-004 stays open) | L1, L2, L4 |
| A9 | `Larder/Support/AccessibilityID.swift`; identifiers on tabs, quick actions, account button, sheet, picker | Accessibility identifiers | L1, L2 (identifiers unique and kebab-case), L4 |
| A10 | `Packages/DesignSystem/Package.swift` (iOS 26, Swift 5 mode per D-014), one placeholder source, builds alone with `xcodebuild`. Not linked to any target (that is the XCODE ACTION) | Local Swift packages | L1 on the package, L2 for the app |

- Acceptance items touched (not ticked): tab bar native (section 1 #8), Groceries / Inspiration switches in place, Scan & Go and quick actions push (D-006), Sign in sheet (D-005).
- L3 (UI tests) cannot run in WP-1: the LarderUITests target is created in the XCODE ACTION. Navigation is covered by B2 in WP-2.
- L4 limits: Claude Code cannot tap the simulator, so screenshots show the launch state only (Home, light, dark, AX5). Pushes, the sheet and the picker are checked by the device test CP-1 and later by B2.
- Risks: the account button sits in the Home toolbar until C1 builds the hero (decision below). `PackageDescription` `.v26` needs a recent tools version, confirmed by building.
- Decisions planned: D-026 `StubScreen` wraps `ContentUnavailableView`; D-027 account button in the Home toolbar, the sheet offers Sign in or Sign out; D-028 DesignSystem package tools version and Swift 5 mode.

## Device-test debt

- WP-1: A1 tab switching not yet verified on a device (CP-1).

## Push debt

- Everything. Nothing on `spec-001-home` has been pushed.

## Decisions made by Claude Code

- None recorded yet through `/sdd`. The next free Decision Log ID is D-026.
- Note: the Decision Log has two rows with ID D-019 (offers badge, and Home layout details). Left as is, since accepted decisions are not rewritten. Flagged for the user.

## Notion write-back queue

- Empty. Pending items go to `docs/sdd/notion-outbox.md`.

## Evidence paths

- `.evidence/<step>/` (git-ignored): simulator screenshots per step, light, dark and the largest accessibility size.
