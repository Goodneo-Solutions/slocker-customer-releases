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
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.6/SLockerCustomer.xcframework.zip",
            checksum: "4cca6eca8167435139bf9ae244073bc81cfc9be82fd7783b72b7e8ddcb42bc6d"
        ),
        .binaryTarget(
            name: "SLockerUI",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.6/SLockerUI.xcframework.zip",
            checksum: "43d31419724184a6e597df91398b640943f86033ac046ffed5611b71417cb007"
        ),
        // A binary target cannot name dependencies: these two empty targets bring SApp and SAppUI into the products.
        .target(name: "SLockerCustomerSApp", dependencies: [.product(name: "SApp", package: "sapp-releases")], path: "Sources/SLockerCustomerSApp"),
        .target(name: "SLockerUISApp", dependencies: [.product(name: "SAppUI", package: "sapp-releases")], path: "Sources/SLockerUISApp"),
    ]
)
