//
//  MonitorPlacerApp.swift
//  MonitorPlacer
//
//  Created by Jäger Uwe on 26.10.21.
//

import Cocoa
import CoreGraphics
import SwiftUI

@main
struct MonitorPlacerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        // SwiftUI wants something here
        var body: some Scene {
            Settings {
                EmptyView()
            }
        }
    }

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBar: StatusBarController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBar = StatusBarController()
        let settings = getCurrentDisplays()
        
        for setting in settings {
            print(setting.id)
            print(setting.uuid)
            print(setting.mode)
            print(setting.x)
            print(setting.y)
        }
//        CGDisplayRegisterReconfigurationCallback({(displayID, flags, _ )->Void in
//            if Int(flags.rawValue) & (1 << 4) > 0 {
//                char curScreenUUID[UUID_SIZE];
//                        CFStringGetCString(CFUUIDCreateString(kCFAllocatorDefault, CGDisplayCreateUUIDFromDisplayID(curScreen)), curScreenUUID, sizeof(curScreenUUID), kCFStringEncodingUTF8);
 //                     printf("Persistent screen id: %s\n", curScreenUUID);
 //           }
 //       }, nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

