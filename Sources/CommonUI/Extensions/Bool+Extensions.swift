//
//  File.swift
//  
//
//  Created by Vince Davis on 5/10/23.
//

import Foundation

public extension Bool {
    static var iOS17: Bool {
        if #available(iOS 17, *) {
            return true
        } else {
            return false
        }
    }
}
