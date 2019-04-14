//
//  UIClassDisplayInformationCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/25/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Displays a cell with left and right title to dispaly given information
 */
public class JHInformationDisplayCell: UITableViewCell {

    // MARK: Instanse variables
    
    private var leftLabel: UILabel!
    private var rightLabel: UILabel!
    
    // MARK: Inits
    
    /**
     Inits a new information cell with given information
     - parameter title: text to be displayed in left label
     - parameter info: text to be displayed in right label
    */
    public init(title: String, info: String) {
        super.init(style: .default, reuseIdentifier: nil)
        selectionStyle = .none
        setUpLeftLabel(withText: title)
        setUpRightLabel(withText: info)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set ups
    
    /**
     Sets up the left title label with given text
     - parameter text: text for the left label
    */
    private func setUpLeftLabel(withText text: String) {
        let fontSizeMultiplier: CGFloat = 1.0
        leftLabel = UILabel()
        leftLabel.text = text
        leftLabel.textColor = UIColor.gray
        leftLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * fontSizeMultiplier)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel)
        leftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
    }
    
    /**
     Sets up the right label for an information cell
     - parameter text: text to display on the left
    */
    private func setUpRightLabel(withText text: String) {
        let fontSizeMultiplier: CGFloat = 1.0
        rightLabel = UILabel()
        rightLabel.text = text
        rightLabel.textColor = UIColor.black
        rightLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * fontSizeMultiplier)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightLabel)
        rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }

}
