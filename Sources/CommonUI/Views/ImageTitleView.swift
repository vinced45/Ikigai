//
//  ImageTitleView.swift
//  
//
//  Created by Vince Davis on 10/5/22.
//

import SwiftUI

public struct ImageTitleView: View {
    var title: String
    var icon: String
    var iconColor: Color
    
    public init(title: String, icon: String, iconColor: Color) {
        self.title = title
        self.icon = icon
        self.iconColor = iconColor
    }
    
    public var body: some View {
        Label(title: {
            Text(title)
        }, icon: {
            IconView(icon: icon, backgroundColor: iconColor)
        })
    }
}

struct ImageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ImageTitleView(title: "Airplane Mode", icon: "airplane", iconColor: .orange)
        }
    }
}
