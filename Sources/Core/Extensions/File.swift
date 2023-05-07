//
//  File.swift
//  
//
//  Created by Vince Davis on 10/14/22.
//

import Foundation

public extension Int {
    var fileSize: String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = .useAll
        formatter.countStyle = .file
        formatter.includesUnit = true
        formatter.isAdaptive = true
        
        return formatter.string(fromByteCount: Int64(self))
    }
}
