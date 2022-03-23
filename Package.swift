// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-cmark-gfm",
    products: [
        .library(
            name: "CMarkGFM",
            targets: ["CMarkGFM"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CMarkGFM",
            dependencies: [],
            exclude: [
                "case_fold_switch.inc",
                "entities.inc",
                "COPYING"
            ],
            publicHeadersPath: "."),
    ]
)
