//
//  WindowController.swift
//  LogCat
//
//  Created by Johannes on 22.10.15.
//  Copyright © 2015 Johannes Steudle. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    let userDefaults = UserDefaults.standard
    
    @IBAction func actionConnect(_ sender: NSToolbarItem) {
        let adbPath = userDefaults.value(forKey: "adbPath")
        let fileManager = FileManager.default
        if (fileManager.fileExists(atPath: ((adbPath as AnyObject).path)!))
        {
            print("We can connect with \(adbPath.debugDescription)")
        } else {
            print("Not found \(adbPath.debugDescription)!")
        }
    }
    
}
