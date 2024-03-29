// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "evaluate-division",
  dependencies: [
    // Local package dependency
    .package(path: "../LeetcodeUtil")  // Relative or absolute path
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "evaluate-division",
      dependencies: [
        "LeetcodeUtil"
      ]),
    .testTarget(
      name: "LeetcodeUtilTests",
      dependencies: ["evaluate-division"]),
  ]
)
