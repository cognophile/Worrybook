//
//  DateTimeHelper.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

struct DateTimeHelper {
    public static func getDateAsString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
    
    public static func getLocalTimeFromDate(date: Date) -> (Int, Int)
    {
        // var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)

        return (hour, minute)
    }
}
