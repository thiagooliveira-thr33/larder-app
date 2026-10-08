# SDD state

Memory between `/sdd` runs. Derived from Notion and git, and never overrides them (Playbook section 2, rank 6).

Last updated: 2026-10-08, WP-2 run: B3, B4, B5, B7 done; B1, B2, B6 wait for the Xcode fix

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
| `fec3de4` | SDD framework (D-021, D-023) |
| `1878e3f` | WP-1 plan |
| `09eabde` | A2: BrandCopy |
| `05b2764` | A3: RootTabView and StubScreen |
| `f86ff3a` | A4: Home in a NavigationStack |
| `16b43c7` | A5: HomeRoute and six pushes |
| `94b847b` | A6: Sign in sheet with detents |
| `efeb8c2` | A7: SessionStore |
| `2518423` | A8: segmented Picker |
| `b4ce60e` | A9: AccessibilityID |
| `c82a504` | A10: DesignSystem package scaffold |
| `349bcd6` | STATE: push recorded, wiring blocked |
| `42cfdec` | WP-2 plan |
| `4d8fb18` | B3: color tokens, package test target |
| `b334230` | B4: Spacing, Radius, Size |
| `661aec9` | B5: Lora Bold brand headlines |
| `5718993` | B7: contrast test |

## Work package status

| WP | Status |
|---|---|
| WP-0 | Done (96e5e6a) |
| WP-1 | Built 2026-10-08 (A1 to A10). Pushed, draft PR #12. Waiting for device test CP-1 |
| WP-2 | In progress. B3, B4, B5, B7 done. B1, B2, B6 wait for the XCODE ACTION fix (see below) |
| WP-3 to WP-8 | To do |

## Plan for the current work package

WP-2 · Wiring, UI tests, tokens, gallery (Lane 2). Written 2026-10-08 before coding. The WP-1 plan is in git history (`748c22e`).

The Xcode fix from the last run is not saved yet (`project.pbxproj` unchanged since 12:28, Xcode open). Following the Playbook (Claude Code picks the step order inside a WP), the package-only steps run first and B1, B2 and B6 wait for the fix. Commits use pathspecs so the user's uncommitted wiring stays out of them.

| Step | Files | Concept | Tests and evidence |
|---|---|---|---|
| B3 | `Packages/DesignSystem/Sources/DesignSystem/Resources/Colors.xcassets` (15 colorsets, light and dark), `Tokens/Colors.swift` (`Color` extensions through `Bundle.module`, Figma-to-Swift renames in the header), `Package.swift` resources | Asset-catalog colors and `Bundle.module` | L1 package build |
| B4 | `Tokens/Spacing.swift`, `Tokens/Radius.swift`, `Tokens/Size.swift` | Design tokens as constants | L1, L2 values match Figma |
| B5 | `Resources/Fonts/Lora-Bold.ttf` and `OFL.txt`, `Tokens/Typography.swift` (runtime registration with CoreText, `Font.brandHeadline28/25` through `Font.custom(_:size:relativeTo:)`) | Dynamic Type with a custom font | L1, L2 font registers and the PostScript name matches |
| B7 | `Tests/DesignSystemTests/ContrastTests.swift`, a package test target | Contrast ratio | L2 on the simulator, failures reported, Figma values untouched |
| B1 | Commit the fixed wiring, align Gallery and LarderUITests with D-011 to D-014 | Per-target build settings | L1 all schemes. Blocked on the XCODE ACTION |
| B2 | `LarderUITests/NavigationSmokeTests.swift` | XCUITest | L3. Blocked on B1 |
| B6 | Gallery token pages | The gallery as a test bed | L1, L4. Blocked on B1 |

- Sources: Design System Spec color table and Figma to Swift map (D-025, D-030). Figma light values were checked on node 78:333 and match. Dark values come from the spec table.
- Risks: Lora static Bold has to be downloaded (OFL, open licence, asset not code). If it can't be downloaded, B5 stops there. Package tests need `xcodebuild` on the package scheme with an iOS simulator.
- Decisions planned: tokens as `Color` static members with `public`; the package test target lives in `Package.swift` (not an Xcode target); the font registers at runtime (no Info.plist change).

## Device-test debt

- WP-1: A1 to A10 not yet verified on a device (CP-1). Pushes, the sheet and the picker have no simulator evidence either, because UI tests need the LarderUITests target (B2).

## Push debt

- 7 local commits since `748c22e` (349bcd6 to 5718993). Due at the end of WP-2, after B1, B2 and B6.
- Earlier: none. `748c22e` pushed to `origin/spec-001-home` (checked 2026-10-08 with `git rev-parse`). Draft PR #12 "SPEC-001: Home" is open.

## XCODE ACTION status (B1 blocked)

Checked 2026-10-08. The project file and new target folders are uncommitted on purpose, waiting for the fix below. Found:
- Stray targets with no source folders on disk: `LarderUITests` (an App target, not a test bundle), `LarderUITestsTests`, `LarderUITestsUITests`. Removing targets is a hard stop, so the user removes them.
- The real UI test bundle is named `LarderUITests 2` (folder `LarderUITests 2/`, bundle ID `thr33.LarderUITests-2`) because the stray app took the name. It needs to be `LarderUITests`.
- `Gallery` was created with testing on, so `GalleryTests` and `GalleryUITests` exist. The recipe says testing None.
- `DesignSystem` is linked to Larder but not to Gallery.
- New targets have iOS 27.0, iPhone and iPad, landscape, bundle IDs `thr33.*`. Claude Code aligns these with D-011 to D-014 in B1 after the fix (allowed exception).

## Decisions made by Claude Code

- D-026 (Accepted): `StubScreen` wraps the native `ContentUnavailableView`.
- D-027 (Accepted): account button in the Home toolbar until C1; the sheet offers Sign in or Sign out.
- D-028 (Accepted): DesignSystem package uses tools 6.2, iOS 26, Swift 5 mode.
- D-031 (Accepted): color tokens look up the catalog by name; Xcode's generated ColorResource symbols trim names (labelOnImage becomes labelOn).
- D-032 (Accepted): `DesignSystemTests` package test target in `Package.swift`.
- D-033 (Accepted): Lora Bold from cyrealtype/Lora-Cyrillic, OFL 1.1, registered at runtime with CoreText.
- D-034 (Accepted): 16 contrast pairs, scrim measured over white. All pass.
- Next free Decision Log ID: D-035 (D-029 and D-030 were added by the user in Notion, so an earlier line saying D-029 was stale).
- Note: the Decision Log has two rows with ID D-019 (offers badge, and Home layout details). Left as is, since accepted decisions are not rewritten. Flagged for the user.

## Notion write-back queue

- Empty. Notion was written directly on 2026-10-08: Build Plan status cells (WP-1, A2 to A10), Decision Log D-026 to D-028, Learning Log session row and concept lines.

## Evidence paths

- `.evidence/<step>/` (git-ignored): simulator screenshots per step, light, dark and the largest accessibility size.
- WP-1: `.evidence/A2/` to `.evidence/A9/` (`light.png`, `dark.png`, `ax5.png`, launch state only). A10 changed no UI.
- WP-2: no UI changed in B3 to B7, so no screenshots. Evidence is the package test run (21 test cases: 15 tokens, 3 layout, 1 font, 32 contrast cases in one parameterised test).
- Package build and test (works):

  ```
  cd Packages/DesignSystem && xcodebuild test -scheme DesignSystem \
    -destination 'platform=iOS Simulator,id=E80BC573-921D-4BA6-B82C-7AB72BE3E245'
  ```

- Follow-ups noted in WP-2: the app's `AccentColor` should match `brandAccent` (Design System Spec map), do it in B1 for Larder and Gallery. Thin contrast margins listed in D-034. `Font.brandHeadline28` scaling at AX5 is checked in B6 and on the device at CP-2.
- Follow-ups noted in WP-1: the toolbar account button does not scale at AX5 (system bar behaviour, review in G2); quick-action rows use system padding for the 44 pt target until C3.
