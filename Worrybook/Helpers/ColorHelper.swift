//
//  ColorHelper.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI

struct ColorHelper {
    public let primaryColor = Color(red: 114 / 255, green: 175 / 255, blue: 176 / 255)
    public let secondaryColor = Color(red: 215 / 255, green: 215 / 255, blue: 215 / 255)
    public let secondaryColorDark = Color(UIColor.lightGray)

    func getTextColor() -> Color {
        return Color(UIColor(named: "schemeTextColour")!)
    }
    
    func getSchemeColour() -> Color {
        Color(UIColor(named: "launchScreenBackground")!)
    }
    
    static func getColor(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
}
