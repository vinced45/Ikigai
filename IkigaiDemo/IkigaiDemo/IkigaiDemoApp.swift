//
//  IkigaiDemoApp.swift
//  IkigaiDemo
//
//  Created by Vince Davis on 5/10/23.
//

import SwiftUI
import CommonUI

@main
struct IkigaiDemoApp: App {
    let persistenceController = PersistenceController.shared
    
    @ObservedObject var manager = ScreenManager()
    @ObservedObject var auth = AuthViewModel()
    
    @State var appInBackground: Bool = true

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .ifOS(.iOS) {
                    $0.externalScreen($manager.showScreen) {
                        OutsideScreenView()
                            .environmentObject(manager)
                    }
                }
                
                .sheet(isPresented: $manager.showScreen) {
                    Button(action: {
                        manager.changeText()
                    }, label: {
                        Text("Update Text")
                    })
                }
                .authenticateView($auth.authenticationNeeded) {
                    Button(action: {
                        auth.authenticate()
                    }, label: {
                        Text("Authenticate")
                    })
                }
//                .backgroundScreen($appInBackground) {
//                    ZStack {
//                        Color.red
//                        Text("In Background")
//                    }.ignoresSafeArea()
//                        .onAppear()
//                }
        }
    }
}

public struct OutsideScreenView: View {
    @EnvironmentObject var screenManager: ScreenManager
    
    public var body: some View {
        ZStack {
            Color.red
            
            Text(screenManager.text)
        }
    }
}

class ScreenManager: ObservableObject {
    @Published var showScreen = false
    @Published var text: String = "Hello"
    
    func changeText() {
        if let random = ["wow", "cool", "better"].randomElement() {
            text = random
        }
    }
    
}
