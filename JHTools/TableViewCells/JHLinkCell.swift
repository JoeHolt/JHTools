//
//  UIClassDisplayLinkCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/26/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 A cell with an outgoing link
 */
public class JHLinkCell: UITableViewCell {
    
    // MARK: Instance variables
    
    public var link: String!
    private var linkTitleLabel: UILabel!
    private var iconView: UIImageView!

    // MARK: Inits
    
    public init(title: String, link: String, image: String) {
        super.init(style: .default, reuseIdentifier: nil)
        self.link = link
        setUpTitleLabel(withText: title)
        setUpImageView(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: set up functions
    
    /**
     Sets up a title label with given text
     - parameter withText: text to set label up with
    */
    private func setUpTitleLabel(withText text: String) {
        linkTitleLabel = UILabel()
        linkTitleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        linkTitleLabel.text = text
        linkTitleLabel.textColor = UIColor.actionBlue
        linkTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(linkTitleLabel)
        linkTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        linkTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
    }
    
    /**
     Sets up icon view on right
     - parameter image: string of image for icon
    */
    private func setUpImageView(image: String) {
        iconView = UIImageView()
        iconView.image = UIImage(named: image)
        iconView.tintColor = UIColor.actionBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)
        iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }
    
}
