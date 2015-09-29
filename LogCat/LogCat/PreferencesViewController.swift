//
//  PreferencesViewController.swift
//  LogCat
//
//  Created by Johannes on 28.09.15.
//  Copyright © 2015 Johannes Steudle. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {
    
    @IBOutlet var labelAdbPath: NSTextField!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let pathToAdb = userDefaults.valueForKey("adbPath") {
            self.labelAdbPath.stringValue = pathToAdb as! String
        }
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        if userDefaults.valueForKey("adbPath") as! String != self.labelAdbPath.stringValue {
            userDefaults.insertValue(self.labelAdbPath.stringValue, inPropertyWithKey: "adbPath")
        }
    }
    
    @IBAction func buttonBrowse(sender: NSButton) {
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
                            self.labelAdbPath.stringValue = url.path!
                        }
                    }
                }
            }
    }
}

