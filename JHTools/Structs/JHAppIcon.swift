//
//  AppIcon.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/8/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import Foundation

/**
 Class holding information for an app icon
 */
class WEAppIcon {
    
    internal var name: String!
    internal var id: String!
    internal var imageName: String!
    internal var whiteIcon: Bool!
    
    /**
     Inits a new image object
    */
    init(name: String, id: String, image: String, whiteIcon: Bool) {
        self.name = name
        self.id = id
        self.imageName = image
        self.whiteIcon = whiteIcon
    }
    
}
