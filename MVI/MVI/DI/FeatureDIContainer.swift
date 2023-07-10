import Foundation

struct FeatureDIContainer {
  var production: [FeatureBuildType] {
    [
      MovieListRouteBuilder(),
      DiscoverListRouteBuilder(),
    ]
  }
}
