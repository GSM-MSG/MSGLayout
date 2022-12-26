// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MSGLayout",
    platforms: [.iOS(.v11), .tvOS(.v11)],
    products: [
        .library(
            name: "MSGLayout",
            targets: ["MSGLayout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MSGLayout",
            dependencies: []
        ),
        .testTarget(
            name: "MSGLayoutTests",
            dependencies: ["MSGLayout"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
