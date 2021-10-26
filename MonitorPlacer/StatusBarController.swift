//
//  StatusBarController.swift
//  MonitorPlacer
//
//  Created by Jäger Uwe on 26.10.21.
//

import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem

    init() {
        statusBar = NSStatusBar()
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)

        if let statusBarButton = statusItem.button {
            statusBarButton.image = #imageLiteral(resourceName: "StatusBarIcon")
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
            let menuItem = NSMenuItem()
            menuItem.title = "Quit"
            menuItem.action = #selector(NSApplication.terminate(_:))
            menuItem.keyEquivalent = "q"
            let menu = NSMenu()
            menu.addItem(menuItem)
            statusItem.menu = menu
        }
    }
}
