import SwiftUI

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
//    func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
//        self.onTapGesture {
//          let impact = UIImpactFeedbackGenerator(style: style)
//          impact.impactOccurred()
//        }
//    }
    
    func emptyState<EmptyContent>(_ isEmpty: Bool, emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
        modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
    }
    
    func externalScreen<ScreenContent>(_ showingExternalScreen: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ExternalScreenViewModifier(showingExternalScreen: showingExternalScreen,  screenContent: screenContent))
    }
}
