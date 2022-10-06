// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "UIKitExtensions",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        .library(
            name: "UIKitExtensions",
            targets: ["UIKitExtensions"]
        )
    ],
    targets: [
        .target(
            name: "UIKitExtensions",
            path: "Sources"
        ),
        .testTarget(
            name: "UIKitExtensionsTests",
            dependencies: ["UIKitExtensions"],
            path: "Tests"
        )
    ]
)
