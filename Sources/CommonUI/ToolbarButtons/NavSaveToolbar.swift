//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/11/22.
//

import SwiftUI

public struct NavSaveToolbar: ToolbarContent {
    var save: () -> Void
    
    public init(save: @escaping ()-> Void) {
        self.save = save
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button("Save") {
                save()
            }
        }
    }
}
