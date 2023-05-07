//
//  File.swift
//  
//
//  Created by Vince Davis on 10/14/22.
//

import Foundation

public enum RoomType: Int, CaseIterable {
    case bedroom
    case kitchen
    case livingRoom
    case bathroom
    case den
    case office
    case familyRoom
    
    var displayName: String {
        switch self {
        case .bedroom:
            return "Bedroom"
        case .kitchen:
            return "Kitchen"
        case .livingRoom:
            return "Living Room"
        case .bathroom:
            return "Bathroom"
        case .den:
            return "Den"
        case .office:
            return "Office"
        case .familyRoom:
            return "Family Room"
        }
    }
}
