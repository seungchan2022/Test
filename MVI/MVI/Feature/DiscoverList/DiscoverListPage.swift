import Foundation
import SwiftUI

struct DiscoverListPage {
  @ObservedObject var viewModel: DiscoverListViewModel
}

extension DiscoverListPage {
  private var state: DiscoverListViewModel.State {
    viewModel.state
  }

  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewModel.send(action: .onChangeSheet($0)) })
  }
}

extension DiscoverListPage: View {
  var body: some View {
    VStack {
      Spacer()
      Text("DiscoverListPage")
      Text("Item is \(state.itemList)")

      if state.itemList.isEmpty {
        Button(action: { viewModel.send(action: .onTapItemListReset) }) {
          Text("아이템 복구해줘")
        }
      } else {
        Button(action: { viewModel.send(action: .onTapItemListClear) }) {
          Text("아이템을 지워줘!")
        }
      }

      if !state.isShowSheet {
        Button(action: { viewModel.send(action: .onChangeSheet(true)) }) {
          Text("시트를 띄워줘")
        }
      }
      Spacer()
    }
    .sheet(isPresented: isShowSheet) {
      VStack {
        Text("씨트얌")
        Button(action: { viewModel.send(action: .onChangeSheet(false)) }) {
          Text("시트 내려줘!")
        }
      }

    }
  }
}
