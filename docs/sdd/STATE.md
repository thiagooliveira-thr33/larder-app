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

Written by the next `/sdd` run before coding.

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
