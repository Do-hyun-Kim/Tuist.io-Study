import ProjectDescription
import ProjectDescriptionHelpers


public extension TargetDependency {
    public struct App {
        public struct Feature {}
        public struct Core {}
    }
    
    public struct ThirdParty {
        public struct Reactive {}
        public struct UI {}
    }
    
}


public extension TargetDependency.App.Feature {
    public static let feature: TargetDependency = .project(
        target: "TuistFeature",
        path: "Feature/TuistFeature"
    )
}

public extension TargetDependency.App.Core {
    public static let thirdParty: TargetDependency = .project(
        target: "TuistCore",
        path: "Core/TuistCore"
    )
}


public extension TargetDependency.ThirdParty.Reactive {
    public static let reactorKit: TargetDependency = .external(name: "ReactorKit")
    public static let rxcocoa: TargetDependency = .external(name: "RxCocoa")
}

public extension TargetDependency.ThirdParty.UI {
    public static let then: TargetDependency = .external(name: "Then")
    public static let snapKit: TargetDependency = .external(name: "SnapKit")
}




