//
//  ContactRow.swift
//  
//
//  Created by Vince Davis on 10/17/22.
//

import SwiftUI

struct ContactRow: View {
    var type: ContactType
    
    var body: some View {
        HStack {
            Image(systemName: type.icon)
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text("Wilson Genral Contracting")
                    .font(.title3)
                    .bold()
                
                Text(type.title)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "info.circle.fill")
            })
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(type: .contractor)
    }
}
