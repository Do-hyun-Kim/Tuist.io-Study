import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains Tuist App target and Tuist unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "Tuist",
    packages: [],
    targets: [
        Target(
            name: "Tuist",
            platform: .iOS,
            product: .app,
            bundleId: "com.project.Tuist",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone,.ipad]),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [],
            settings: nil
        ),
        Target(
            name: "TuistTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.project.Tuist",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Tuist")
            ]
        )
    
    ]
)
