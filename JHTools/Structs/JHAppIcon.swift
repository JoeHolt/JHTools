//
//  AppIcon.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/8/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

/**
 Class holding information for an app icon
 */
public class JHAppIcon {
    
    public var name: String!
    public var id: String!
    public var imageName: String!
    public var whiteIcon: Bool!
    
    /**
     Inits a new image object
    */
    public init(name: String, id: String, image: String, whiteIcon: Bool) {
        self.name = name
        self.id = id
        self.imageName = image
        self.whiteIcon = whiteIcon
    }
    
}
