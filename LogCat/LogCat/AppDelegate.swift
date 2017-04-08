//
//  AppDelegate.swift
//  LogCat
//
//  Created by Johannes on 22.09.15.
//  Copyright © 2015 Johannes Steudle. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func actionOpen(_ sender: NSMenuItem) {
        print("File open")
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.begin
            {
                (result) -> Void in
                if result == NSFileHandlingPanelOKButton
                {
                    if let url = panel.url
                    {
                        let fileManager = FileManager.default
                        if (fileManager.fileExists(atPath: url.path))
                        {
                            print(url.path)
                        }
                    }
                }
        }
    }
}

