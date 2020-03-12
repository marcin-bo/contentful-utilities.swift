// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ContentfulUtilities",
    products: [
        .executable(
            name: "ContentfulUtilities",
            targets: ["ContentfulUtilities"]
        ),
        .library(
            name: "ContentfulSyncSerializer",
            type: .dynamic,
            targets: ["ContentfulSyncSerializer"])
    ],
    dependencies: [
      .package(url: "https://github.com/contentful/contentful-persistence.swift", .exact("0.11.0")),
      .package(url: "https://github.com/contentful/contentful.swift", .exact("2.0.0")),
      .package(url: "https://github.com/jensravens/Interstellar", .exact("2.1.0")),
      .package(url: "https://github.com/kylef/Commander", .exact("0.8.0")),
      .package(url: "https://github.com/johnsundell/files.git", .exact("2.2.1"))
    ],
    targets: [
        .target(
            name: "ContentfulUtilities",
            dependencies: [
                "ContentfulSyncSerializer",
                "Commander",
                "Interstellar"
            ]
        ),
        .target(
            name: "ContentfulSyncSerializer",
            dependencies: [
                "ContentfulPersistence",
                "Contentful",
                "Interstellar"
            ]
        ),
        .testTarget(
            name: "ContentfulSyncSerializerTests",
            dependencies: [
                "ContentfulSyncSerializer",
                "Files",
                "Interstellar"
            ]
        )
    ]
)
