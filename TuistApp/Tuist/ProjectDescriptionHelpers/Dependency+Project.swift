import ProjectDescription
import ProjectDescriptionHelpers


public extension TargetDependency {
    public enum Project {}
}

public extension TargetDependency.Project {
    static let Feature = TargetDependency.project(
        target: "Feature",
        path: .relativeToRoot("Feature/**")
    )
}


