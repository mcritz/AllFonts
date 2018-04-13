//: Let’s get all the fonts

import AppKit

struct FontFamily: Codable {
    let name: String
    let fonts: [String]
}

let baseFontSize: CGFloat = 24
let fontMan = NSFontManager()
let fontFamilies = fontMan.availableFontFamilies.sorted()

var fontData = [Any]()
var fontNames = [String]()

func fontName(from data: [Any]) -> String? {
    if let name = data.first as? String {
        return name
    }
    return nil
}

func makeFontFamily(with name: String) -> FontFamily {
    var faceNames = [String]()
    let someFaces = NSFontManager().availableMembers(ofFontFamily: name)
    if let realFaces: [[Any]] = someFaces {
        for face in realFaces {
            if let realName = fontName(from: face) {
                faceNames.append(realName)
            }
        }
    }
    return FontFamily(name: name, fonts: faceNames)
}

var fontFamilyData = [FontFamily]()
for fontFamilyName in fontFamilies {
    fontFamilyData.append(makeFontFamily(with: fontFamilyName))
}

let encoder = JSONEncoder()

let data = try encoder.encode(fontFamilyData)

