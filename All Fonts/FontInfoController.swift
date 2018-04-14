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

class FontInfoController {
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
    
    init() {
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
    
    private func getJSON(from data: [FontFamily]) throws -> Data?  {
        do {
            let jsonEncoded = try encoder.encode(data)
            return jsonEncoded
        } catch {
            print("Could not encode")
        }
        return nil
    }
    
    func save() {
        let maybeDocURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let docURL: URL = maybeDocURL {
            let fileUrl: URL = docURL.appendingPathComponent("-fonts.json")
            do {
                let maybeJSON = try getJSON(from: fontInfo.fontFamilies)
                if let fontJSON: Data = maybeJSON {
                    try fontJSON.write(to: fileUrl)
                    print("file saved: \(fileUrl)")
                }
            } catch {
                print("!!!")
            }
        }
    }
}
