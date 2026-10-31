// swift-tools-version: 5.9
// sLocker customer side for iOS and macOS: SLockerCustomer (the smart-locker operations for a service provider's
// customers) and SLockerUI (the SwiftUI pickup list and locker map), as prebuilt XCFrameworks over sApp.
// Documentation: https://open.superroute.ca/developer
import PackageDescription

let package = Package(
    name: "SLockerCustomer",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "SLockerCustomer", targets: ["SLockerCustomer", "SLockerCustomerSApp"]),
        // The kit is built over the customer side, so its product carries both.
        .library(name: "SLockerUI", targets: ["SLockerUI", "SLockerCustomer", "SLockerUISApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Goodneo-Solutions/sapp-releases", from: "0.2.5"),
    ],
    targets: [
        .binaryTarget(
            name: "SLockerCustomer",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.1/SLockerCustomer.xcframework.zip",
            checksum: "cc6eee7c4af2a4fbb47617fd28e743dcc55380ff44d094303237e0e1d08d287d"
        ),
        .binaryTarget(
            name: "SLockerUI",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.1/SLockerUI.xcframework.zip",
            checksum: "c4f9b2e165394aa501c45d729471149f2f25918e16da0e9e7c2ae0713609acb1"
        ),
        // A binary target cannot name dependencies: these two empty targets bring SApp and SAppUI into the products.
        .target(name: "SLockerCustomerSApp", dependencies: [.product(name: "SApp", package: "sapp-releases")], path: "Sources/SLockerCustomerSApp"),
        .target(name: "SLockerUISApp", dependencies: [.product(name: "SAppUI", package: "sapp-releases")], path: "Sources/SLockerUISApp"),
    ]
)
