import DesignSystem
import SwiftUI
import Foundation

extension AppSearchPage {
  struct HeaderComponent {
    let viewState: ViewState
    let text: Binding<String>
    let isFocused: FocusState<Bool>.Binding
    let clearAction: () -> Void
    let searchAction: () -> Void
  }
}

extension AppSearchPage.HeaderComponent: View {

  var body: some View {
    VStack {
      VStack {
        HStack {
          AppTextField(
            text: text,
            placeHolder: viewState.placeHolder,
            isDisabled: false)
            .focused(isFocused, equals: true)
          if !text.wrappedValue.isEmpty {
            Button(action: clearAction) {
              Text("취소")
            }
            .tint(AppColor.Tint.primary)
          }
        }
        .frame(maxHeight: 50)
        .withDefaultPadding(edges: .horizontal)
        .withRoundRect(
          fillColor: AppColor.Background.base,
          cornerRadius: 8,
          strokeColor: AppColor.Tint.secondary,
          strokeWidth: 1)
      }
    }
    .withDefaultPadding()
    .background(AppColor.Tint.primary)
    .animation(.easeInOut, value: text.wrappedValue)
  }

}

extension AppSearchPage.HeaderComponent {
  struct ViewState: Equatable {
    let placeHolder: String
  }
}
