//
//  FontCollectionViewItem.swift
//  All Fonts
//
//  Created by Michael Critz on 4/29/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import Cocoa

class FontCollectionViewItem: NSCollectionViewItem {
    var fontName: String?
    var expositionText = "Pack my box with five dozen liquor jugs"
    
    @IBOutlet weak var fontLabel: NSTextFieldCell!
    @IBOutlet weak var titleLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fontName = fontName {
            titleLabel.stringValue = fontName
            fontLabel.stringValue = expositionText
            attributedString(fontName: fontName)
        }
    }
    func attributedString(fontName: String) {
        let theFont = NSFont(name: fontName, size: 24)
        fontLabel.font = theFont
    }
}

