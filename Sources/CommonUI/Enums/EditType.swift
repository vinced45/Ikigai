//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation

public enum EditType {
    case new(ModelType)
    case update(ModelType)
    
    var titleName: String {
        switch self {
        case .new(let model): return "New \(model.titleName)"
        case .update(let model): return "Edit \(model.titleName)"
        }
    }
}
