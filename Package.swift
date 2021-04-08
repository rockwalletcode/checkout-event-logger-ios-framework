// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CheckoutEventLoggerKit",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "CheckoutEventLoggerKit",
            targets: ["CheckoutEventLoggerKit"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "CheckoutEventLoggerKit",
            path: "CheckoutEventLoggerKit.xcframework"
        ),
    ]
)
