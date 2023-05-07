//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/9/22.
//

import SwiftUI

public struct SectionHeaderView: View {
    var text: String
    var action: () -> Void
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        HStack {
            Text(text)
                .font(.title2)
                .bold()
            
            Spacer()
            
            Button(action: action, label: {
                Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                    .font(.title2)
            })
        }
        .padding()
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(text: "Hello", action: {
            print("tapped")
        })
    }
}
