//
//  IconView.swift
//  
//
//  Created by Vince Davis on 10/5/22.
//

import SwiftUI

public struct IconView: View {
    var icon: String
    var backgroundColor: Color
    var iconColor: Color = .white
    
    public init(icon: String, backgroundColor: Color, iconColor: Color = .white) {
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
    }
    
    public var body: some View {
        Image(systemName: icon)
            .foregroundColor(iconColor)
            .padding(8)
            .background(backgroundColor)
            .clipShape(Rectangle())
            .cornerRadius(10)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(icon: "bell", backgroundColor: .orange)
    }
}
