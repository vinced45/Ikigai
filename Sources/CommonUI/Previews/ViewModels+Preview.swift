//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation

public extension TagsViewModel {
    static var preview: TagsViewModel {
        return TagsViewModel(tags: TagItem.previewItems)
    }
}
