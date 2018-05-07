//
//  FontCollectionViewController.swift
//  All Fonts
//
//  Created by Critz, Michael on 5/7/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import Cocoa

class FontCollectionViewController: NSViewController {

    @IBOutlet weak var FontSearchFIeld: NSSearchField!
    @IBOutlet weak var fontCollectionView: FontCollectionView!

    let fontInfoCtlr = FontInfoController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontCollectionView.dataSource = fontInfoCtlr
    }
    
}
