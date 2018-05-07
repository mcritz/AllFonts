//
//  FontCollectionView.swift
//  All Fonts
//
//  Created by Michael Critz on 4/28/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import AppKit

class FontCollectionView: NSCollectionView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.wantsLayer = true
    }
}

//extension FontCollectionView: NSCollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
//        return NSSize(width: 350, height: 120)
//    }
//    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
//        return NSSize(width: 700, height: 40)
//    }
//}
