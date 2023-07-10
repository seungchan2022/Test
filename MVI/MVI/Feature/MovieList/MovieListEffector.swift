import Foundation
import UIKit

struct MovieListEffector {

  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MovieListEffector {
  var routeToDiscover: () -> Void {
    {
      navigator.push(
        featureName: Link.discoverList.rawValue,
        items: ["itemList": "1,2,3"],
        isAnimation: true)
    }
  }

  func getItemList(callback: @escaping ([MovieListViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      callback([
        .init(imageURL: .none, title: "영화이름", date: .init(), rate: 3.2, summery: "영화 줄거리")
      ])
    }
  }
}

