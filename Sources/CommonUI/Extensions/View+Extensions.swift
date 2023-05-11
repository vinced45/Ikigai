import SwiftUI
import Core

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
    
    @ViewBuilder
    func ifOS<Content: View>(_ operatingSystems: OperatingSystem...,modifier: (Self) -> Content) -> some View {
        if operatingSystems.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }

    func modify<T: View>(@ViewBuilder modifier: (Self) -> T) -> T {
        modifier(self)
    }
}

// MARK: - iOS & macOS Only Extensions
#if os(iOS) || os(macOS)
public extension View {
    func authenticateView<AuthContent>(_ authenticationNeeded: Binding<Bool>, authContent: @escaping () -> AuthContent) -> some View where AuthContent: View {
        modifier(AuthViewModifier(authenticationNeeded: authenticationNeeded, authContent: authContent))
    }
}
#endif

// MARK: - iOS Only Extensions
#if os(iOS)
public extension View {
    func externalScreen<ScreenContent>(_ showingExternalScreen: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ExternalScreenViewModifier(showingExternalScreen: showingExternalScreen,  screenContent: screenContent))
    }
    
    func backgroundScreen<ScreenContent>(_ inBackground: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ForegroundViewModifier(inBackground: inBackground, screenContent: screenContent))
    }
}
#endif
