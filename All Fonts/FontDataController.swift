//
//  FontDataController.swift
//  All Fonts
//
//  Created by Critz, Michael on 4/12/18.
//  Copyright © 2018 Michael Critz. All rights reserved.
//

import AppKit


let baseFontSize: CGFloat = 24
/*
struct FamilyData: Encodable {
    let name: String
    var fonts: [String]
    
    init(name: String) {
        self.name = name
        let fontNames = NSFontCollection.withAllAvailableDescriptors
        var theFonts = [String]()
        for fontName in fontNames {
            let maybeFont = NSFont(name: fontName, size: baseFontSize)
            if let font: NSFont = maybeFont {
                theFonts.append(font.fontName)
            }
        }
        self.fonts = theFonts
    }
}

let fontFamilies = NSFont.familyNames.sorted()

var allFontData = [FamilyData]()

for fontFamily in fontFamilies {
    allFontData.append(FamilyData(name: fontFamily))
}

allFontData
let encoder = JSONEncoder()
var fontJSONData = Data()
do {
    fontJSONData = try encoder.encode(allFontData)
} catch {
    print("BAD THING HAPPENED")
}
print(fontJSONData)

let systemVersion = UIDevice.current.systemVersion

let fileName = "\(systemVersion)-fonts.json"
if let fileDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    let fileURL = fileDirectory.appendingPathComponent(fileName)
    do {
        try fontJSONData.write(to: fileURL)
        print(fileURL.absoluteString)
    } catch {
        print("COULD NOT WRITE FILE")
    }
}

*/
