//
//  ViewController.swift
//  All Fonts
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import AppKit

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
        guard let window = view.window else {
            return
        }
        let panel = NSSavePanel()
        panel.directoryURL = FileManager.default.homeDirectoryForCurrentUser
        panel.nameFieldStringValue = fontInfoController.fileName()
        panel.beginSheetModal(for: window) { (result) in
            if result == NSApplication.ModalResponse.OK,
                let url = panel.url {
                    do {
                        try self.fontInfoController.save(at: url)
                    } catch {
                        print("Couldn't save")
                    }
                }
        }
    }
    
}

