// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Lambda",
  platforms: [
    .macOS(.v10_13)
  ],
  products: [
    .executable(name: "Lambda", targets: ["Lambda"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/swift-server/swift-aws-lambda-runtime.git",
      .upToNextMajor(from: "0.2.0")
    )
  ],
  targets: [
    .target(
      name: "Lambda",
      dependencies: [
        .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime")
      ]
    ),
    .testTarget(name: "LambdaTests", dependencies: ["Lambda"]),
  ]
)
