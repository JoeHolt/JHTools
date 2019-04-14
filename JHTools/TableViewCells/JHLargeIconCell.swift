//
//  WEAppIconCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/8/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 A cell that displays a large icon on the left and a title next to it, used in things like App Icon pickers
 */
public class JHLargeIconCell: UITableViewCell {

    // MARK: Variables
    
    private let title: String!
    private let image_title: String!
    private let outlineIcon: Bool!
    
    // MARK: Inits
    
    public init(title: String, image: String, outlineIcon: Bool) {
        self.title = title
        self.image_title = image
        self.outlineIcon = outlineIcon
        super.init(style: .default, reuseIdentifier: nil)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set up
    
    /**
     Sets up the cell UI
    */
    private func setUp() {
        self.textLabel?.text = title
        self.imageView?.layer.cornerRadius = 8.0
        self.imageView?.clipsToBounds = true
        self.imageView?.image = UIImage(named: image_title)
        if outlineIcon {
            self.imageView?.layer.borderColor = UIColor.black.cgColor
            self.imageView?.layer.borderWidth = 1.0
        }
    }

}
