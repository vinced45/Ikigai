//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/14/22.
//

import SwiftUI

struct DocListView: View {
    var body: some View {
        NavigationStack {
            List(DocItem.previewItems) { doc in
                DocRowView(doc: doc)
            }
            .navigationTitle("Documents")
        }
    }
}

struct DocListView_Previews: PreviewProvider {
    static var previews: some View {
        DocListView()
    }
}
