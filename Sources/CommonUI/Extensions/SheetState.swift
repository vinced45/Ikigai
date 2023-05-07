//
//  File.swift
//  
//
//  Created by Vince Davis on 10/11/22.
//

import Foundation
import SwiftUI

public class SheetState<State>: ObservableObject {
    @Published public var isShowing = false
    @Published public var state: State? {
        didSet { isShowing = state != nil }
    }
    
    public init(isShowing: Bool = false, state: State? = nil) {
        self.isShowing = isShowing
        self.state = state
    }
}
