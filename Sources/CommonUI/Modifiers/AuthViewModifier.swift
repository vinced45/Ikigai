//
//  File.swift
//  
//
//  Created by Vince Davis on 5/10/23.
//

import Foundation
#if os(macOS) || os(iOS)
import LocalAuthentication
import SwiftUI

struct AuthViewModifier<AuthContent>: ViewModifier where AuthContent: View {
    @Binding var authenticationNeeded: Bool
    let authContent: () -> AuthContent

    func body(content: Content) -> some View {
        content
//            .ifOS(.iOS) {
//                $0.fullScreenCover(isPresented: $authenticationNeeded, content: {
//                    authContent()
//                })
//            }
            .transaction({ transaction in
                transaction.disablesAnimations = true
            })
    }
}

public class AuthViewModel: ObservableObject {
    @Published public var authenticationNeeded: Bool
    
    public init(authenticationNeeded: Bool = true) {
        self.authenticationNeeded = authenticationNeeded
    }
    
    public func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    self.authenticationNeeded = false
                } else {
                    // there was a problem
                    self.authenticationNeeded = true
                }
            }
        } else {
            // no biometrics
        }
    }
}
#endif
