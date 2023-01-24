import ProjectDescription
import ProjectDescriptionHelpers


let thirdParty = Project.makeFrameWork(
    name: "TuistCore",
    product: .staticFramework,
    dependencies: [
        .ThirdParty.UI.snapKit,
        .ThirdParty.UI.then,
        .ThirdParty.Reactive.reactorKit,
        .ThirdParty.Reactive.rxcocoa
    
    ]
)
