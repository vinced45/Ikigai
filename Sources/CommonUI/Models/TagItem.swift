//
//  TagItem.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//
import Foundation

// MARK: Tag Model
public struct TagItem: Identifiable, Hashable {
    public var id = UUID().uuidString
    public var name: String
    public var isSelected: Bool = false
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
