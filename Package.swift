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
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.2/SLockerCustomer.xcframework.zip",
            checksum: "00e4bdfbddbac5f2bfc577f5d0126751319232c30796f29364b50dfa4a2ef756"
        ),
        .binaryTarget(
            name: "SLockerUI",
            url: "https://github.com/Goodneo-Solutions/slocker-customer-releases/releases/download/0.2.2/SLockerUI.xcframework.zip",
            checksum: "28c8e198188dc47c4941d05173670cc53ef16f4f30b0d17a48964c7f7a980cf3"
        ),
        // A binary target cannot name dependencies: these two empty targets bring SApp and SAppUI into the products.
        .target(name: "SLockerCustomerSApp", dependencies: [.product(name: "SApp", package: "sapp-releases")], path: "Sources/SLockerCustomerSApp"),
        .target(name: "SLockerUISApp", dependencies: [.product(name: "SAppUI", package: "sapp-releases")], path: "Sources/SLockerUISApp"),
    ]
)
