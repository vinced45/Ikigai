//
//  File.swift
//  
//
//  Created by Vince Davis on 10/14/22.
//

import Foundation

public struct DocItem: Identifiable{
    public var id = UUID().uuidString
    public var name: String
    public var type: DocType
    public var location: String
    public var fileSize: String
    public var created: Date
}
