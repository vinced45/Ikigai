//
//  File.swift
//  
//
//  Created by Vince Davis on 10/14/22.
//

import Foundation

public enum HomeType: Int, CaseIterable, Codable, Comparable {
    case primary = 0
    case rental
    case vaction
    
    public static func < (lhs: HomeType, rhs: HomeType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var displayName: String {
        switch self {
        case .primary: return "Primary"
        case .rental: return "Rental"
        case .vaction: return "Vacation"
        }
    }
}
