// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZxcvbnSwift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZxcvbnSwift",
            targets: ["ZxcvbnSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ZxcvbnSwift",
            dependencies: [],
            exclude: ["Info.plist"],
            resources: [
                .process("Resources")
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
