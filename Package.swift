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
    dependencies: [
        .package(
            name: "CombineExtensions",
            url: "https://github.com/dsk1306/combineExtensions",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "UIKitExtensions",
            dependencies: ["CombineExtensions"],
            path: "Sources"
        ),
        .testTarget(
            name: "UIKitExtensionsTests",
            dependencies: ["UIKitExtensions"],
            path: "Tests"
        )
    ]
)
