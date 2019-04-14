//
//  File.swift
//  WiscEnroll
//
//  Created by Joe Holt on 12/24/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import Foundation

// only used for unit testing, not in production code
// https://stackoverflow.com/questions/31746223/number-of-occurrences-of-substring-in-string-in-swift
public extension String {
    /**
     Gets the number of the given charachter
     - parameter of: character to count
     - returns: number of charachter in parameter
    */
    func count(of needle: Character) -> Int {
        return reduce(0) {
            $1 == needle ? $0 + 1 : $0
        }
    }
    
    /**
     Trims and returns the given string with only the first chars capitalized
     - parameter splitBy: char to split string by when captializing firt letter
    */
    func capitalizingFirstLetter(splitBy splitChar: Character) -> String {
        let str = self.trimmingCharacters(in: .whitespaces)
        let split = str.split(separator: splitChar)
        var ret: String = ""
        for s in split {
            // very rudamentery function that checks for romans and does not auto capitalize if they are found. Really only works with the I roman numerals
            let romans = "IIIIVIIVXX" // check if one of the splits is a substring of the romans
            if romans.contains(s.uppercased()) {
                ret = ret + s.uppercased() + String(splitChar)
            } else {
                ret = ret + String(s.prefix(1).uppercased()) + String(s.lowercased().dropFirst())
            }
            if let last = split.last {
                if last != s {
                    ret += String(splitChar)
                }
            }
        }
        ret = ret.trimmingCharacters(in: .whitespaces)
        return ret
    }
}
