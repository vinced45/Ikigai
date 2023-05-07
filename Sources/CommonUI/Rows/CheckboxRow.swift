/// A view that displays a checkbox with text.
///
///
/// ```swift
/// public var text: String
/// @State var isChecked: Bool
///
/// var body: some View {
///     
/// }
/// ```
import SwiftUI

public struct CheckboxRow: View {
    public var text: String
    @State var isChecked: Bool = false
    
    public init(text: String, isChecked: Bool = false) {
        self.text = text
        self.isChecked = isChecked
    }
    
    public var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square" : "square")
            Text(text)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxRow(text: "Test Text")
    }
}
