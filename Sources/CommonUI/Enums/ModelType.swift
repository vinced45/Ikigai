//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation
import SwiftUI

public enum ModelType: CaseIterable {
    case contact
    case doc
    case expense
    case home
    case inventory
    case photo
    case room
    case tag
    case task
    
    var titleName: String {
        switch self {
        case .contact: return "Contact"
        case .doc: return "Document"
        case .expense: return "Expense"
        case .home: return "Home"
        case .inventory: return "Inventory"
        case .photo: return "Photo"
        case .room: return "Room"
        case .tag: return "Tag"
        case .task: return "Task"
        }
    }
    
    var color: Color {
        switch self {
        case .contact: return .blue
        case .doc: return .blue
        case .expense: return .red
        case .home: return .orange
        case .inventory: return .brown
        case .photo: return .accentColor
        case .room: return .orange
        case .tag: return .red
        case .task: return .purple
        }
    }
    
    var icon: String {
        switch self {
        case .contact: return "person.fill"
        case .doc: return "doc.fill"
        case .expense: return "creditcard.fill"
        case .home: return "house.fill"
        case .inventory: return "shippingbox.fill"
        case .photo: return "camera.fill"
        case .room: return "bed.double.fill"
        case .tag: return "tag.fill"
        case .task: return "list.bullet.fill"
        }
    }
    
    var emptyStateIcon: String {
        switch self {
        case .contact: return "person.crop.circle.fill"
        case .doc: return "doc.circle.fill"
        case .expense: return "creditcard.circle.fill"
        case .home: return "house.circle.fill"
        case .inventory: return "shippingbox.circle.fill"
        case .photo: return "camera.circle.fill"
        case .room: return "bed.double.circle.fill"
        case .tag: return "tag.circle.fill"
        case .task: return "list.bullet.circle.fill"
        }
    }
    
    var emptyStateTitle: String {
        switch self {
        case .contact: return "No Contacts"
        case .doc: return "No Documents"
        case .expense: return "No Expenses"
        case .home: return "No Homes"
        case .inventory: return "No Inventory"
        case .photo: return "No Photos"
        case .room: return "No Rooms"
        case .tag: return "No Tags"
        case .task: return "No Tasks"
        }
    }
    
    var emptyStateMessage: String {
        switch self {
        case .contact: return "You have no contacts. Tap the button below to add."
        case .doc: return "You have no docs. Tap the button below to add."
        case .expense: return "You have no expenses. Tap the button below to add."
        case .home: return "You have no homes. Tap the button below to add."
        case .inventory: return "You have no inventory. Tap the button below to add."
        case .photo: return "You have no photos. Tap the button below to add."
        case .room: return "You have no rooms. Tap the button below to add."
        case .tag: return "You have no tags. Use the field below to add one."
        case .task: return "You have no tasks. Tap the button below to add."
        
        }
    }
    
    var emptyStateHideButton: Bool {
        switch self {
        case .contact: return false
        case .doc: return false
        case .expense: return false
        case .home: return false
        case .inventory: return false
        case .photo: return false
        case .room: return false
        case .tag: return true
        case .task: return false
        
        }
    }
}
