// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "zxcvbn-swift",
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
                .process("generated/adjacency_graphs.json"),
                .process("generated/frequency_lists.json")
            ],
            cSettings: [
                .headerSearchPath("Internal")
            ]
        )
    ]
)
