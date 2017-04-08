//
//  ViewController.swift
//  LogCat
//
//  Created by Johannes on 22.09.15.
//  Copyright © 2015 Johannes Steudle. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.titleVisibility = NSWindowTitleVisibility.hidden;
        self.view.window?.titlebarAppearsTransparent = true;
        self.view.window?.styleMask = NSWindowStyleMask.unifiedTitleAndToolbar;
    }

}

