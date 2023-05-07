//
//  BadgeView.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

public struct BadgeView: View {
    
    var name: String
    var color: Color = .blue
    var type: BadgeType = .normal
    
    public enum BadgeType {
        case normal
        case removable(()->())
    }
    
    public init(name: String, color: Color = .blue, type: BadgeType = .normal) {
        self.name = name
        self.color = color
        self.type = type
    }
    
    public var body: some View {
        HStack{
            // Badge Label
            Text(name)
                .font(Font.caption.bold())
            
            // Add 'x' if removable, and setup tap gesture
            switch type {
                case .removable( let callback):
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                        .font(Font.caption.bold())
                        .onTapGesture {
                            callback()
                        }
                default:
                    EmptyView()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color)
        .cornerRadius(20)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(name: "SwiftUI")
    }
}
