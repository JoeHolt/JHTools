//
//  DoubleExtension.swift
//  JHTools
//
//  Created by Joe Holt on 4/15/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

extension Double {
    
    // Rounds the double to decimal places value
    public func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
