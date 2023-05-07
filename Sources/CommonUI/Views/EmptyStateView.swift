//
//  EmptyStateView.swift
//  
//
//  Created by Vince Davis on 10/13/22.
//

import SwiftUI

public struct EmptyStateView: View {
    var modelType: ModelType
    var action: () -> Void
    
    public init(modelType: ModelType, action: @escaping () -> Void) {
        self.modelType = modelType
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Image(systemName: modelType.emptyStateIcon)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(modelType.color)
                .font(.system(size: 144))
            
            Text(modelType.emptyStateTitle)
                .font(.system(size: 36))
                .bold()
            
            Text(modelType.emptyStateMessage)
                .foregroundColor(.gray)
                .lineLimit(3)
                .multilineTextAlignment(.center)
            
            Button(action: {
                action()
            }, label: {
                Text("Add \(modelType.titleName)")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .tint(modelType.color)
            .if(modelType.emptyStateHideButton) { view in
                view.hidden()
            }
        }
        .padding(50)
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(modelType: .home, action: {})
    }
}
