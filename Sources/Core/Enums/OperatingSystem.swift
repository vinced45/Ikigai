//
//  File.swift
//  
//
//  Created by Vince Davis on 5/10/23.
//

import Foundation

public enum OperatingSystem {
    case macOS
    case iOS
    case tvOS
    case watchOS

    #if os(macOS)
    public static let current = macOS
    #elseif os(iOS)
    public static let current = iOS
    #elseif os(tvOS)
    public static let current = tvOS
    #elseif os(watchOS)
    public static let current = watchOS
    #else
    #error("Unsupported platform")
    #endif
}
