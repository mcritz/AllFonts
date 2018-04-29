//
//  FontCollectionView.swift
//  All Fonts
//
//  Created by Michael Critz on 4/28/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import AppKit

class FontCollectionView: NSCollectionView {
    
    let fontInfoCtlr = FontInfoController()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.dataSource = fontInfoCtlr
    }
    
}
