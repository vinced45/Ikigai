//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation

public enum SortType: Identifiable {
    case tag
    case home
    case dueDate
    case completed
    
    public var id: Self { self }
    
    
    
    public var displayName: String {
        switch self {
        case .dueDate: return "Due Date"
        case .completed: return "Completed"
        case .home: return "Home"
        case .tag: return "Tag"
        }
    }
}

public extension SortType {
    static var taskSorts: [SortType] {
        return [.home, .dueDate, .completed]
    }
}
