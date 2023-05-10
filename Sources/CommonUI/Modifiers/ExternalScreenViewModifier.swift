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
    @StateObject var screenManager: ExternalScreenManager
    let screenContent: () -> ScreenContent
    
    @State var additionalWindows: [UIWindow] = []
    
    func body(content: Content) -> some View {
//        if screenManager.isShowingOnExternalDisplay {
//            screenContent()
//                .onReceive(
//                    screenManager.screenDidConnectPublisher,
//                    perform: screenManager.screenDidConnect
//                )
//                .onReceive(
//                    screenManager.screenDidDisconnectPublisher,
//                    perform: screenManager.screenDidDisconnect
//                )
//        }
//        else {
//            content
//                //.environmentObject(externalDisplayContent)
//                .onReceive(
//                    screenManager.screenDidConnectPublisher,
//                    perform: screenManager.screenDidConnect
//                )
//                .onReceive(
//                    screenManager.screenDidDisconnectPublisher,
//                    perform: screenManager.screenDidDisconnect
//                )
//        }
        
        content
            //.environmentObject(externalDisplayContent)
            .onReceive(
                screenDidConnectPublisher,
                perform: screenDidConnect
            )
            .onReceive(
                screenDidDisconnectPublisher,
                perform: screenDidDisconnect
            )
            .sheet(isPresented: $screenManager.isShowingOnExternalDisplay, content: {
                ExternalControlScreenView()
                    .environmentObject(screenManager)
            })
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

        let view = screenContent()
            .environmentObject(screenManager)
        let controller = UIHostingController(rootView: view)
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
        screenManager.isShowingOnExternalDisplay = true
    }

    private func screenDidDisconnect(_ screen: UIScreen) {
        additionalWindows.removeAll { $0.screen == screen }
        screenManager.isShowingOnExternalDisplay = false
    }
}

public class ExternalScreenManager: ObservableObject {
    @Published public var text: String
    
    @Published public var isShowingOnExternalDisplay = false
    
    public init(text: String) {
        self.text = text
    }

    public func updateText() {
        text = "Changed"
    }
}

public struct ExternalControlScreenView: View {
    @EnvironmentObject var screenManager: ExternalScreenManager
    
    public var body: some View {
        Button(action: {
            screenManager.updateText()
        }, label: {
            Text("Update Text")
        })
    }
}
