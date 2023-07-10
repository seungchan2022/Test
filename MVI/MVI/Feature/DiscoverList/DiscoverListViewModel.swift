import Foundation

final class DiscoverListViewModel: ObservableObject {

  @Published var state: State
  private let effector: DiscoverListEffector

  init(
    initialState: State,
    effector: DiscoverListEffector)
  {
    self.state = initialState
    self.effector = effector
  }

  func send(action: ViewAction) {
    switch action {
    case .onTapItemListClear:
      state.itemList = ""
      return

    case .onTapItemListReset:
      state.itemList = state.tempItemList
      return

    case .onChangeSheet(let isShow):
      print("AAA ", isShow)
      state.isShowSheet = isShow
      return
    }
  }
}

extension DiscoverListViewModel {
  struct State: Equatable {
    var itemList: String
    var isShowSheet: Bool
    let tempItemList: String

    init(itemList: String, isShowSheet: Bool = false, tempItemList: String) {
      self.itemList = itemList
      self.isShowSheet = isShowSheet
      self.tempItemList = tempItemList
    }
  }

  enum ViewAction: Equatable {
    case onTapItemListClear
    case onTapItemListReset
    case onChangeSheet(Bool)
  }
}
