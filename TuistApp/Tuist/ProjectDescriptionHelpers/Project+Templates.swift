import ProjectDescription
import ProjectDescriptionHelpers



//MARK: Project
public extension Project {
    
    static func makeFrameWork(
        name: String,
        product: Product,
        dependencies: [TargetDependency] = [],
        packages: [Package] = [],
        sources: SourceFilesList = ["Sources/**"]
    ) -> Self {
        
        let frameworkSettings: Settings = .settings(
            base: [:],
            configurations: [
                .release(name: .release)
            ],
            defaultSettings: .recommended
        )
        
        let frameworkTarget: Target = Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: "com.project.\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies,
            settings: frameworkSettings
        )
        let target: [Target] = [frameworkTarget]
        
        return Project(
            name: name,
            packages: packages,
            settings: frameworkSettings,
            targets: target
        )
    }
    
    
    static func makeApp(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Self {
        
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ],
            defaultSettings: .recommended
        )
        
        let appTarget: Target = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "com.project.\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
        
        
        let appTestTarget: Target = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.project.\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )
        
        let scheme: [Scheme] = [.makeScheme(target: .debug, name: name)]
        
        let target: [Target] = [appTarget, appTestTarget]
        
        
        return Project(
            name: name,
            packages: packages,
            settings: settings,
            targets: target,
            schemes: scheme
        )
    }

}




public extension Scheme {
    
    static func makeScheme(
        target: ConfigurationName,
        name: String
    ) -> Self {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target, options: .options(
                    coverage: true,
                    codeCoverageTargets: ["\(name)"]
                )
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    
}
