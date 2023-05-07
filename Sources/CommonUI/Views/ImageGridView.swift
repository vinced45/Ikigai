//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/9/22.
//

import SwiftUI

struct ImageGridView: View {
    let images: [String] = [
        "folder.badge.person.crop",
        "folder.badge.person.crop",
        "folder.badge.person.crop",
        "folder.badge.person.crop",
        "folder.badge.person.crop"]
    
    
    var body: some View {
        Grid {
            GridRow {
                Rectangle()
                     .foregroundColor(.orange)
                     .gridCellColumns(3)
                
                 Grid {
                     Rectangle()
                         .foregroundColor(.gray)
                     
                     Rectangle()
                         .foregroundColor(.gray)
                         
                     
                     Rectangle()
                         //.foregroundColor(.gray)
                         .if(images.count < 4,
                             transform: { view in
                             view.hidden()
                         })
                         .if(images.count > 4,
                             transform: { view in
                             view.foregroundColor(.green)
                             
                         })
                 }
                 .gridCellColumns(1)
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
            .frame(width: 320, height: 260)
    }
}
