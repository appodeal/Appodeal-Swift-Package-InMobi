// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealInMobiAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealInMobiAdapter",
            targets: ["AppodealInMobiAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/InMobi/InMobiSDK-Swift-Package", exact: "11.5.0"),
    ],
    targets: [
        .target(
            name: "AppodealInMobiAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "InMobiSDK", package: "InMobiSDK-Swift-Package"),
                .target(name: "AppodealInMobiAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealInMobiAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealInMobiAdapter/11.5.0.0/de76ab763eed/AppodealInMobiAdapter.xcframework.zip",
            checksum: "de76ab763eedc30f57b2500a41b375dc4a5a75fe005f15fe49178b4da749035d"
        ),

    ]
)
