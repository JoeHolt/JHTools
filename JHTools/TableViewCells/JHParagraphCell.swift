//
//  UIClassDisplayDescriptionCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/23/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Cell designed to hold paragraph of information
 */
public class JHParagraphCell: UITableViewCell {

    // MARK: Variables
    
    private var displayDescription: String!
    private var displayDescriptionLabel: UILabel!
    
    // MARK: Inits
    
    init(description: String, fontSize: CGFloat = 13.0) {
        super.init(style: .default, reuseIdentifier: nil)
        self.displayDescription = description
        selectionStyle = .none
        setUpDescriptionCell(forFontSize: fontSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Funcs
    
    /**
     Sets up the description cell
    */
    private func setUpDescriptionCell(forFontSize size: CGFloat) {
        self.displayDescriptionLabel = UILabel()
        displayDescriptionLabel.text = self.displayDescription
        displayDescriptionLabel.font = UIFont.systemFont(ofSize: size, weight: .regular)
        displayDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        displayDescriptionLabel.numberOfLines = 0
        displayDescriptionLabel.lineBreakMode = .byWordWrapping
        addSubview(displayDescriptionLabel)
        displayDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
        displayDescriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        displayDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
        displayDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -JHTableViewCellConstants.bottomSpacing).isActive = true
    }

}
