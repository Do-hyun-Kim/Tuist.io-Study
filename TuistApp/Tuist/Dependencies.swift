import ProjectDescription
import ProjectDescriptionHelpers


let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/ReactorKit/ReactorKit.git",
            requirement: .upToNextMajor(from: "3.2.0")
        ),
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "3.0.0")
        )
        
    ],
    platforms: [.iOS]
)
