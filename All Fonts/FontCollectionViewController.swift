//
//  FontCollectionViewController.swift
//  All Fonts
//
//  Created by Critz, Michael on 5/7/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import Cocoa

class FontCollectionViewController: NSViewController, NSSearchFieldDelegate, NSCollectionViewDataSource {

    @IBOutlet weak var fontSearchField: NSSearchField!
    @IBOutlet weak var fontCollectionView: FontCollectionView!
    @IBOutlet weak var noSearchResultsLabel: NSTextField!
    
    let fontInfoCtlr = FontInfoController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        noSearchResultsLabel.isHidden = true
        fontCollectionView.dataSource = self
        fontSearchField.sendsWholeSearchString = false
        fontSearchField.sendsSearchStringImmediately = false
        fontSearchField.delegate = self
    }
    
    func handle(query: String) {
        let fontFamilies = fontInfoCtlr.getThings(matching: query)
        var someFonts = "\(query) : "
        for fontThing in fontFamilies {
            for fontName in fontThing.fonts {
                someFonts.append(fontName)
            }
        }
        fontInfoCtlr.fontInfo.fontFamilies = fontFamilies
        if fontFamilies.count == 0 {
            noSearchResultsLabel.isHidden = false
        } else {
            noSearchResultsLabel.isHidden = true
        }
        fontCollectionView.reloadData()
    }
    func searchFieldDidEndSearching(_ sender: NSSearchField) {
        handle(query: sender.stringValue)
    }
    func searchFieldDidStartSearching(_ sender: NSSearchField) {
        handle(query: sender.stringValue)
    }
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return fontInfoCtlr.fontInfo.fontFamilies.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        let thisFamily = fontInfoCtlr.fontInfo.fontFamilies[section]
        return thisFamily.fonts.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let thisFamily = fontInfoCtlr.fontInfo.fontFamilies[indexPath.section]
        let thisFontName = thisFamily.fonts[indexPath.item]
        let fontCell = FontCollectionViewItem()
        fontCell.fontName = thisFontName
        //        print("\(indexPath.section) \(indexPath.item) : \(thisFontName)")
        return fontCell
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        
        var nibIdentifier = "FontColletionFooter"
        
        switch kind {
        case NSCollectionView.SupplementaryElementKind.sectionHeader:
            nibIdentifier = "FontCollectionHeader"
        default:
            nibIdentifier = "FontColletionFooter"
        }
        
        let supplementaryView = collectionView.makeSupplementaryView(ofKind: kind, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: nibIdentifier), for: indexPath)
        if let supplementaryView = supplementaryView as? FontCollectionHeaderView {
            supplementaryView.headerLabel.stringValue = fontInfoCtlr.fontInfo.fontFamilies[indexPath.section].name
        }
        //            print("HEADER \(indexPath.section) : \(indexPath.item) : \(fontInfoCtlr.fontInfo.allFontFamilies[indexPath.section])\n")
        return supplementaryView
    }

}
