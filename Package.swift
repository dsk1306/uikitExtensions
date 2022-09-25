// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "UIKitExtensions",
    platforms: [
      .iOS(.v15),
      .macOS(.v12),
      .macCatalyst(.v15),
      .tvOS(.v15),
      .watchOS(.v8)
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
