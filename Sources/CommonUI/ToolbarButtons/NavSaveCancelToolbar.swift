//
//  ToolBarControls.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

public struct NavSaveCancelToolbar: ToolbarContent {
    var cancel: () -> Void
    var save: () -> Void
    
    public init(save: @escaping ()-> Void, cancel: @escaping () -> Void) {
        self.cancel = cancel
        self.save = save
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
                cancel()
            }
        }
        
        ToolbarItem(placement: .confirmationAction) {
            Button("Save") {
                save()
            }
        }
    }
}
