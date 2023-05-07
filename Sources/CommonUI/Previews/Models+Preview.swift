//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation
import Core

public extension TagItem {
    static var previewItems: [TagItem] {
        let rawTags: [String] = [
            "SwiftUI","Xcode","Apple","WWDC 22","iOS 16","iPadOS 16","macOS 13","watchOS 9","Xcode 14","API's"
        ]
            .sorted(by: { $0 < $1 })
        let tags: [TagItem] = rawTags.map({ TagItem(name: $0) })
        
        return tags
    }
}

public extension DocItem {
    static var preview: DocItem {
        return .init(name: "My Test Doc",
                     type: .doc,
                     location: "Le Chateau",
                     fileSize: 1234564646.fileSize,
                     created: Date.from(string: "09/26/2022"))
    }
    
    static var previewItems: [DocItem] {
        return [
            .init(name: "My Test Doc",
                  type: .doc,
                  location: "Le Chateau",
                  fileSize: 1234564646.fileSize,
                  created: Date.from(string: "09/26/2022")),
            .init(name: "My Cool Image",
                  type: .jpeg,
                  location: "Blake St",
                  fileSize: 1234.fileSize,
                  created: Date.from(string: "07/26/2021")),
            .init(name: "Reports",
                  type: .xls,
                  location: "Hollywood",
                  fileSize: 12346.fileSize,
                  created: Date.from(string: "09/26/2022")),
            .init(name: "Contract",
                  type: .pdf,
                  location: "Space X",
                  fileSize: 4568852.fileSize,
                  created: Date.from(string: "10/05/2022"))
        ]
    }
}
