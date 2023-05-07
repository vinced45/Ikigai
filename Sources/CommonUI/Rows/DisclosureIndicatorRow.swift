//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import SwiftUI

public struct DisclosureIndicatorRow<Label: View>: View {
    var action: () -> Void
    var label: () -> Label
    
    public init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button(action: action, label: {
            HStack {
                label()
                Spacer()
                NavigationLink.empty
            }
        })
    }
}

struct DisclosureIndicatorRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            DisclosureIndicatorRow {
                print("Tapped")
            } label: {
                Text("Disclosure row 1")
            }
        }
        
    }
}
