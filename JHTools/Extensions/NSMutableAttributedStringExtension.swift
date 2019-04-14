//
//  NSMutableAttributedStringExtension.swift
//  WiscEnroll
//
//  Created by Joe Holt on 12/26/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import Foundation
import UIKit


public extension NSMutableAttributedString {
    
    // https://stackoverflow.com/questions/28496093/making-text-bold-using-attributed-string-in-swift
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    // https://stackoverflow.com/questions/28496093/making-text-bold-using-attributed-string-in-swift
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
    
    // https://stackoverflow.com/questions/38737920/swift-nsattributedstring-trim
    func trimmedAttributedString() -> NSMutableAttributedString {
        let invertedSet = CharacterSet.whitespacesAndNewlines.inverted
        let startRange = string.rangeOfCharacter(from: invertedSet)
        let endRange = string.rangeOfCharacter(from: invertedSet, options: .backwards)
        guard let startLocation = startRange?.upperBound, let endLocation = endRange?.lowerBound else {
            return NSMutableAttributedString(string: string)
        }
        let location = string.distance(from: string.startIndex, to: startLocation) - 1
        let length = string.distance(from: startLocation, to: endLocation) + 2
        let range = NSRange(location: location, length: length)
        return NSMutableAttributedString(attributedString: attributedSubstring(from: range))
    }
    
    /**
     Builds a new bolded attributed string given a normal string
     - parameter forMainString: entire string to be processed
     - parameter boldedPart: part to bold
     - returns: partially bolded string
     */
    static func makeBoldString(forMainString main: String, boldedPart bolded: String) -> NSMutableAttributedString {
        let string = main as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: UIFont.systemFontSize)])
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)]
        
        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: bolded))
        
        return attributedString
    }
    
    /**
     Bulds a new string with a clickable link
     - parameter main: Main string
     - parameter linkPart: part to make a link
     - parameter link: link to insert
     - returns: linked string
    */
    static func makeLinkedString(forMainString main: String, linkPart: String, link: String) -> NSMutableAttributedString {
        let string = main as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: UIFont.systemFontSize)])
        let linkAttribute = [NSAttributedString.Key.link: link]
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)]
        let colorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.wiscoBlue]
        
        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: main))
        attributedString.addAttributes(colorAttribute, range: string.range(of: main))
        attributedString.addAttributes(linkAttribute, range: string.range(of: linkPart))
        
        return attributedString
    }
}
