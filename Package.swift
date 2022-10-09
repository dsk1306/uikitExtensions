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
    dependencies: [
        .package(
            url: "https://github.com/dsk1306/combineExtensions",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "UIKitExtensions",
            dependencies: [
                .product(name: "CombineExtensions", package: "combineExtensions")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "UIKitExtensionsTests",
            dependencies: ["UIKitExtensions"],
            path: "Tests"
        )
    ]
)
