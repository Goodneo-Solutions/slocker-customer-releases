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
        .package(url: "https://github.com/Goodneo-Solutions/sapp-releases", from: "0.2.2"),
    ],
    targets: [
        .binaryTarget(
            name: "SLockerCustomer",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.0/SLockerCustomer.xcframework.zip",
            checksum: "2b02012c03028aedd1d167b75814c2150fde3fc31b5730a4c50dbe7303ac4c32"
        ),
        .binaryTarget(
            name: "SLockerUI",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.0/SLockerUI.xcframework.zip",
            checksum: "667c1b0e029184a51d83b8ecea851a1302038300303ab301f7403d105e7e16d9"
        ),
        // A binary target cannot name dependencies: these two empty targets bring SApp and SAppUI into the products.
        .target(name: "SLockerCustomerSApp", dependencies: [.product(name: "SApp", package: "sapp-releases")], path: "Sources/SLockerCustomerSApp"),
        .target(name: "SLockerUISApp", dependencies: [.product(name: "SAppUI", package: "sapp-releases")], path: "Sources/SLockerUISApp"),
    ]
)
