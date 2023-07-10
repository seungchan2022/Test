import Foundation
import UIKit

public struct AppDiContainer {

  func production() -> [NavigatorType] {
    [
      TabNavigator(
        tabName: "Movies",
        defaultFeatureName: Link.movieList.rawValue,
        defaultItems: [:],
        defaultImage: UIImage(systemName: "video"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production),
      TabNavigator(
        tabName: "Discover",
        defaultFeatureName: Link.discoverList.rawValue,
        defaultItems: ["itemList": "다나까!"],
        defaultImage: UIImage(systemName: "web.camera"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production)
    ]
  }
}

