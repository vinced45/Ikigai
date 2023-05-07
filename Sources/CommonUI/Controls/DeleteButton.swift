//
//  DeleteButton.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

public struct DeleteButton: View {
    @State private var isPresentingConfirm: Bool = false
    var title: String
    var confirmText: String
    var action: () -> Void
    
    public init(title: String = "Delete", confirmText: String, action: @escaping () -> Void) {
        self.title = title
        self.confirmText = confirmText
        self.action = action
    }
    public var body: some View {
        Button {
            //let impact = UIImpactFeedbackGenerator(style: .rigid)
            //impact.impactOccurred()
            isPresentingConfirm.toggle()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
        .confirmationDialog("Are you sure?",
                            isPresented: $isPresentingConfirm) {
             Button(confirmText, role: .destructive) {
                 action()
             }
        } message: {
            Text("You cannot undo this action")
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(confirmText: "Delete Home?", action: {})
    }
}
