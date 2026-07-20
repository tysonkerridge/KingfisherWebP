// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KingfisherWebP",
    platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)], 
    products: [
        .library(name: "KingfisherWebP", targets: ["KingfisherWebP"])
    ],
    dependencies: [
        .package(url: "https://github.com/tysonkerridge/Kingfisher.git", revision: "c847f7b0104fdb6e5540417906ad63437372edba"),
        .package(url: "https://github.com/SDWebImage/libwebp-Xcode.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "KingfisherWebP",
            dependencies: ["Kingfisher", "KingfisherWebP-ObjC"],
            path: "Sources",
            exclude: ["KingfisherWebP-ObjC"]
        ),
        .target(
            name: "KingfisherWebP-ObjC",
            dependencies: [
                .product(name: "libwebp", package: "libwebp-Xcode"),
            ]
        )
    ]
)
