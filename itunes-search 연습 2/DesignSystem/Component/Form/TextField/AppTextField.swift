import Foundation
import SwiftUI

public struct AppTextField {
  let text: Binding<String>
  let placeHolder: String?
  let isDisabled: Bool

  public init(text: Binding<String>, placeHolder: String?, isDisabled: Bool) {
    self.text = text
    self.placeHolder = placeHolder
    self.isDisabled = isDisabled
  }
}

extension AppTextField: View {

  public var body: some View {
    TextField("", text: text)
      .placeholder(when: text.wrappedValue.isEmpty) {
        Text(placeHolder ?? "")
          .foregroundColor(AppColor.Label.base)
          .opacity(0.7)
      }
      .disabled(isDisabled)
      .opacity(isDisabled ? 0.7 : 1)
  }

}

extension View {
  fileprivate func placeholder<Content: View>(
    when shouldShow: Bool,
    alignment: Alignment = .leading,
    @ViewBuilder placeholder: () -> Content) -> some View {

      ZStack(alignment: alignment) {
        placeholder().opacity(shouldShow ? 1 : 0)
        self
      }
    }
}
