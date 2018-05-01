//
//  FontDataController.swift
//  All Fonts
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import AppKit

struct FontFamily: Codable {
    let name: String
    let fonts: [String]
}

struct FontInfo {
    let fontManager = NSFontManager()
    var allFontFamilies: [String] {
        get {
            return self.fontManager.availableFontFamilies.sorted()
        }
    }
    var fontFamilies = [FontFamily]()
}

class FontInfoController: NSObject {
    let baseFontSize: CGFloat = 24
    var fontInfo = FontInfo()
    let encoder = JSONEncoder()
    
    private func fontName(from data: [Any]) -> String? {
        if let name = data.first as? String {
            return name
        }
        return nil
    }
    
    func makeFontFamily(with name: String) -> FontFamily {
        var faceNames = [String]()
        let someFaces = fontInfo.fontManager.availableMembers(ofFontFamily: name)
        if let realFaces: [[Any]] = someFaces {
            for face in realFaces {
                if let realName = fontName(from: face) {
                    faceNames.append(realName)
                }
            }
        }
        return FontFamily(name: name, fonts: faceNames)
    }
    
    func getFamiles(from familyNames: [String]) -> [FontFamily] {
        var fontFamilies = [FontFamily]()
        for name in familyNames {
            fontFamilies.append(makeFontFamily(with: name))
        }
        return fontFamilies
    }
    
    private func countFaces(in fontFamilies: [FontFamily]) -> Int {
        var faceCount = 0
        for fontFamily in fontFamilies {
            faceCount += fontFamily.fonts.count
        }
        return faceCount
    }
    
    override init() {
        super.init()
        fontInfo.fontFamilies = getFamiles(from: fontInfo.allFontFamilies)
    }
    
    // Mark - Display
    
    func summary() -> String {
        return """
        Font Families: \(fontInfo.allFontFamilies.count)
        Font Faces: \(countFaces(in: fontInfo.fontFamilies))
        """
    }
    
    // Mark - Saving
    
    func getJSON(from data: [FontFamily]?) throws -> Data?  {
        var fontFamilies = data
        if data?.count == nil {
            fontFamilies = fontInfo.fontFamilies
        }
        do {
            let jsonEncoded = try encoder.encode(fontFamilies)
            return jsonEncoded
        } catch {
            print("Could not encode")
        }
        return nil
    }
    
    func fileName() -> String {
        let systemVersion = ProcessInfo.processInfo.operatingSystemVersion
        return "macOS-\(systemVersion.majorVersion).\(systemVersion.minorVersion)-fonts.json"
    }
    
    func save(at location: URL?) throws {
        var fileLocation = location
        if location == nil {
            let maybeDocURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            if let docURL: URL = maybeDocURL {
                fileLocation = docURL
            }
        }
        if let realLocation: URL = fileLocation {
            do {
                let maybeJSON = try getJSON(from: fontInfo.fontFamilies)
                if let fontJSON: Data = maybeJSON {
                    try fontJSON.write(to: realLocation)
                    print("file saved: \(realLocation)")
                }
            } catch {
                print("!!!")
            }
        }
    }
}

extension FontInfoController: NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return fontInfo.allFontFamilies.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        let thisFamily = fontInfo.fontFamilies[section]
        return thisFamily.fonts.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let thisFamily = fontInfo.fontFamilies[indexPath.section]
        let thisFontName = thisFamily.fonts[indexPath.item]
        let fontCell = FontCollectionViewItem()
        fontCell.fontName = thisFontName
//        print("\(indexPath.section) \(indexPath.item) : \(thisFontName)")
        return fontCell
    }
    
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
        
        let supplementaryView = collectionView.makeSupplementaryView(ofKind: .sectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FontCollectionHeader"), for: indexPath)
            if let supplementaryView = supplementaryView as? FontCollectionHeaderView {
                supplementaryView.headerLabel.stringValue = fontInfo.allFontFamilies[indexPath.section]
            }
//            print("HEADER \(indexPath.section) : \(indexPath.item) : \(fontInfo.allFontFamilies[indexPath.section])\n")
        return supplementaryView
    }
}
