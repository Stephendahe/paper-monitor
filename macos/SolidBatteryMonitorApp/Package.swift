// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SolidBatteryMonitorApp",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "SolidBatteryMonitorCore", targets: ["SolidBatteryMonitorCore"]),
        .executable(name: "SolidBatteryMonitorApp", targets: ["SolidBatteryMonitorApp"]),
    ],
    targets: [
        .target(
            name: "SolidBatteryMonitorCore",
            path: "Sources/SolidBatteryMonitorCore"
        ),
        .executableTarget(
            name: "SolidBatteryMonitorApp",
            dependencies: ["SolidBatteryMonitorCore"],
            path: "Sources/SolidBatteryMonitorApp"
        ),
        .testTarget(
            name: "SolidBatteryMonitorAppUnitTests",
            dependencies: ["SolidBatteryMonitorCore"],
            path: "Tests/SolidBatteryMonitorAppUnitTests"
        ),
    ]
)
