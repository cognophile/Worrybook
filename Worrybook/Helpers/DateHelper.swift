//
//  DateHelper.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

struct DateHelper {
    public static func getDateAsString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        return formatter.string(from: date)
    }
}
