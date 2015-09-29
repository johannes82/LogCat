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



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func actionOpen(sender: NSMenuItem) {
        print("File open")
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.beginWithCompletionHandler
            {
                (result) -> Void in
                if result == NSFileHandlingPanelOKButton
                {
                    if let url = panel.URL
                    {
                        let fileManager = NSFileManager.defaultManager()
                        if (fileManager.fileExistsAtPath(url.path!))
                        {
                            print(url.path!)
                        }
                    }
                }
        }
    }
}

