//
//  File.swift
//  
//
//  Created by Vince Davis on 5/9/23.
//

import SwiftUI
import Combine
import UIKit

struct ExternalScreenViewModifier<ScreenContent: View>: ViewModifier where ScreenContent: View {
    var showScreen: Bool
    let screenContent: () -> ScreenContent
    
    @ObservedObject var externalDisplayContent = ExternalDisplayContent()
    @State var additionalWindows: [UIWindow] = []

    func body(content: Content) -> some View {
        if showScreen {
            screenContent()
                .environmentObject(externalDisplayContent)
                .onReceive(
                    screenDidConnectPublisher,
                    perform: screenDidConnect
                )
                .onReceive(
                    screenDidDisconnectPublisher,
                    perform: screenDidDisconnect
                )
        }
        else {
            content
                .environmentObject(externalDisplayContent)
                .onReceive(
                    screenDidConnectPublisher,
                    perform: screenDidConnect
                )
                .onReceive(
                    screenDidDisconnectPublisher,
                    perform: screenDidDisconnect
                )
        }
    }
    
    private var screenDidConnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didConnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    private var screenDidDisconnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didDisconnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private func screenDidConnect(_ screen: UIScreen) {
        let window = UIWindow(frame: screen.bounds)

        window.windowScene = UIApplication.shared.connectedScenes
            .first { ($0 as? UIWindowScene)?.screen == screen }
            as? UIWindowScene

//        ScreenContent
//            .environmentObject(externalDisplayContent)
        let controller = UIHostingController(rootView: screenContent())
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
        externalDisplayContent.isShowingOnExternalDisplay = true
    }

    private func screenDidDisconnect(_ screen: UIScreen) {
        additionalWindows.removeAll { $0.screen == screen }
        externalDisplayContent.isShowingOnExternalDisplay = false
    }
}

class ExternalDisplayContent: ObservableObject {

    @Published var string = "hello"
    @Published var isShowingOnExternalDisplay = false

}
