//
//  DeviceDetailHelper.swift
//  Worrybook
//
//  Created by Alex Boggis on 11/09/2021.
//

import Foundation
import SwiftUI

struct DeviceDetailHelper {
    public static func getMachineName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { identifier, element in
          guard let value = element.value as? Int8, value != 0 else { return identifier }
          return identifier + String(UnicodeScalar(UInt8(value)))
        }
    }
    
    public static func getOperatingSystemVersion() -> String {
        return "\(UIDevice.current.systemVersion))"
    }
    
    public static func getDeviceDetails() -> String {
        return "\(UIDevice.current.model) \(UIDevice.current.systemName)"
    }
}
