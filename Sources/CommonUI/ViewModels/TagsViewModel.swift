//
//  TagsViewModel.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation

public class TagsViewModel: NSObject, ObservableObject {
    @Published var tags: [TagItem]
    @Published var selectedTags: [TagItem]
    @Published var text: String = ""
    
    public init(tags: [TagItem], selectedTags: [TagItem] = [], text: String = "") {
        self.tags = tags
        self.selectedTags = selectedTags
        self.text = text
    }
    
    public var selectedDisplayText: String {
        return selectedTags.count == 0 ? "" : "\(selectedTags.count) Selected"
    }
    
    var isDisabled: Bool {
        if text == "" {
            return true
        } else if tags.filter({ $0.name == text }).count > 0 {
            return true
        } else {
            return false
        }
    }
    
    public func update(tags: [TagItem]) {
        self.tags = tags
    }
}
