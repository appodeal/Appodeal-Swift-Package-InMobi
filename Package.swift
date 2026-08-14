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
        .package(url: "https://github.com/InMobi/InMobiSDK-Swift-Package", exact: "11.3.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealInMobiAdapter/11.3.0.0/AppodealInMobiAdapter.xcframework.zip",
            checksum: "60b84c398dafca7f4db2374ca591f783cadc7cf97cecd75180f4ea9b01583764"
        ),

    ]
)
