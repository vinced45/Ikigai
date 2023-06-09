// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ikigai",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]),
        .library(
            name: "Core",
            targets: ["Core"]),
        .library(
            name: "Ikigai",
            targets: ["Ikigai"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/LiveUI/Awesome", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CommonUI",
            dependencies: [
                .product(name: "Awesome", package: "Awesome"),
                "Core"
            ]),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]),
        .target(
            name: "Core",
            dependencies: []),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
        .target(
            name: "Ikigai",
            dependencies: []),
        .testTarget(
            name: "IkigaiTests",
            dependencies: ["Ikigai"]),
    ]
)
