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
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let pathToAdb = userDefaults.value(forKey: "adbPath") {
            self.labelAdbPath.stringValue = pathToAdb as! String
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        if userDefaults.value(forKey: "adbPath") as! String != self.labelAdbPath.stringValue {
            userDefaults.insertValue(self.labelAdbPath.stringValue, inPropertyWithKey: "adbPath")
        }
    }
    
    @IBAction func buttonBrowse(_ sender: NSButton) {
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
                            self.labelAdbPath.stringValue = url.path
                        }
                    }
                }
            }
    }
}

