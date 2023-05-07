//
//  File.swift
//  
//
//  Created by Vince Davis on 10/17/22.
//

import Foundation

public enum ContactType: Int, CaseIterable {
    case contractor
    case hospital
    case plumber
    case police
    case fireDepartment
    
    var title: String {
        switch self {
        case .contractor: return "Contractor"
        case .hospital: return "Hospital"
        case .plumber: return "Plumber"
        case .police: return "Police"
        case .fireDepartment: return "Fire Department"
        }
    }
    
    var icon: String {
        switch self {
        case .contractor: return "hammer.circle.fill"
        case .hospital: return "stethoscope.circle.fill"
        case .plumber: return "drop.circle.fill"
        case .police: return "shield.fill"
        case .fireDepartment: return "flame.circle.fill"
        }
    }
}
