//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import Foundation

public extension Date {
    static func from(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/yyyy"
        guard let date = dateFormatter.date(from: string) else { return Date() }
        
        return date
    }
    
    func add(days: Int) -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: days, to: self)
        return nextDate ?? Date()
    }
}
