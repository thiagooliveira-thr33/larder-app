// swift-tools-version: 6.2
// Tools 6.2 is the first PackageDescription with `.v26` (D-028).

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v26), // D-011
    ],
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]
        ),
    ],
    swiftLanguageModes: [.v5] // D-014
)
