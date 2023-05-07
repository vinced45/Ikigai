//
//  File.swift
//  
//
//  Created by Vince Davis on 10/13/22.
//

import Foundation
import SwiftUI
import Awesome

public enum DocType {
    case jpeg
    case png
    case pdf
    case xls
    case doc
    
    var icon: Awesome.Regular {
        switch self {
        case .jpeg: return Awesome.Regular.fileImage
        case .png: return Awesome.Regular.fileImage
        case .pdf: return Awesome.Regular.filePdf
        case .xls: return Awesome.Regular.fileExcel
        case .doc: return Awesome.Regular.fileWord
        }
    }
}
