//
//  WEMasterSettingsCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/8/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//
import UIKit

/**
 Cell with a small icon left alligned, similar to settings app
 */
public class JHSmallImageCell: UITableViewCell {
    
    init(title: String, image: String) {
        super.init(style: .default, reuseIdentifier: nil)
        setUp(forTitle: title, imageTitle: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Sets up the ui of the cell
     - parameter forTitle: title of the cell
     - parameter imageTitle: image name for the cell image
     */
    private func setUp(forTitle title: String, imageTitle: String) {
        self.textLabel?.text = title
        self.accessoryType = .disclosureIndicator
        self.imageView?.image = UIImage(named: imageTitle)
        self.imageView?.clipsToBounds = true
        self.imageView?.layer.cornerRadius = 8.0
    }
    
}
