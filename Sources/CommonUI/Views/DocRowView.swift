//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/13/22.
//

import SwiftUI
import Awesome



public struct DocRowView: View {
    var doc: DocItem
    
    public init(doc: DocItem) {
        self.doc = doc
    }
    
    public var body: some View {
        HStack {
            doc.type.icon.image
                .size(40)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                Text(doc.name)
                    .font(.title3)
                    .bold()
                    
                Text("\(doc.fileSize) - \(doc.location)")
                    .font(.caption)
            }
            
            Spacer()
            
            Text(doc.created.formatted(date: .numeric, time: .omitted))
        }
    }
}

struct DocRowView_Previews: PreviewProvider {
    static var previews: some View {
        DocRowView(doc: .preview)
    }
}
