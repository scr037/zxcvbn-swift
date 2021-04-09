// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "zxcvbn-swift",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "zxcvbn-swift",
            targets: ["ZxcvbnSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ZxcvbnSwift",
            dependencies: [],
            exclude: ["Info.plist"],
            resources: [
                .copy("Resources")
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Public"),
                .headerSearchPath("Internal")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
            ]
        )
    ]
)
