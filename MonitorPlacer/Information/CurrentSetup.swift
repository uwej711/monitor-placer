//
//  CurrentSetup.swift
//  MonitorPlacer
//
//  Created by Jäger Uwe on 31.10.21.
//

import Foundation
import CoreGraphics
import ApplicationServices

func getCurrentDisplays() -> Array<Setting> {
    var displayCount: UInt32 = 0
    CGGetOnlineDisplayList(UInt32.max, nil, &displayCount)
    
    var onlineDisplays = [CGDirectDisplayID](repeating: UInt32(0), count: Int(displayCount))
    CGGetOnlineDisplayList(displayCount, &onlineDisplays, &displayCount)
    
    var settings: [Setting] = []
    
    for id in onlineDisplays {
        let uuid: Unmanaged<CFUUID> = CGDisplayCreateUUIDFromDisplayID(id)
        let uuidAsCFString = CFUUIDCreateString(nil, uuid.takeRetainedValue())
        let setting = Setting(id:id, uuid:(uuidAsCFString! as NSString) as String)
        
        let displayMode: CGDisplayMode? = getDisplayMode(displayId: id)
        
        if displayMode != nil  {
            setting.mode = displayMode?.ioDisplayModeID ?? 0
        }
        
        let bounds: CGRect = getDisplayOrigin(displayId: id)
        
        setting.x = (Int)(bounds.origin.x)
        setting.y = (Int)(bounds.origin.y)
        
        settings.append(setting)
    }
    
    return settings;
}

func getDisplayMode(displayId: UInt32) -> CGDisplayMode? {
    return CGDisplayCopyDisplayMode(displayId)
}

func getDisplayOrigin(displayId: UInt32) -> CGRect {
    return CGDisplayBounds(displayId)
}
