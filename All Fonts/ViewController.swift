//
//  ViewController.swift
//  All Fonts
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textFieldCell: NSTextFieldCell!
    
    let fontInfoController = FontInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldCell.stringValue = fontInfoController.summary()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        fontInfoController.save()
    }
    
}

