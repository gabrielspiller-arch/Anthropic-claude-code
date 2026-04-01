// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DietTracker",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "DietTracker",
            targets: ["DietTracker"]
        ),
    ],
    targets: [
        .target(
            name: "DietTracker",
            path: "DietTracker"
        ),
    ]
)
