//
//  UIClassDisplayInformationExpandCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/26/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 An information cell that when tapped can expand the cells info to display more text
*/
public class JHExapandableInformationDisplayCell: UITableViewCell {

    // MARK: Instance variables
    
    private var titleLabel: UILabel!
    private var arrowView: UIImageView!
    private var detailLabel: UILabel!
    private var expandLabel: UILabel!
    private var expandText: String!
    
    // MARK: Inits
    
    public init(title: String, detailText: String, expandText: String) {
        super.init(style: .default, reuseIdentifier: nil)
        selectionStyle = .none
        setUpTitleLabel(forText: title)
        setUpImageLabel()
        setUpRightDetailLabel(forText: detailText)
        setUpExpandLabel()
        self.expandText = expandText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action functions
    
    /**
     Expands the cell, requires a relayout
    */
    public func expandCell() {
        self.expandLabel.text = self.expandText
        self.detailLabel.alpha = 0.0
        self.arrowView.alpha = 0.0
    }
    
    // MARK: Set Up Functions
    
    /**
     Sets up the title label on the left side of the screen
     - parameter forText: text to put on the label
    */
    private func setUpTitleLabel(forText text: String) {
        self.titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        titleLabel.textColor = UIColor.gray
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
    }
    
    /**
     Sets up the imageview with a down arrow on the right
     */
    private func setUpImageLabel() {
        self.arrowView = UIImageView(image: UIImage(named: "dropArrow"))
        arrowView.tintColor = UIColor.darkGray
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowView)
        arrowView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
        arrowView.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
    }
    
    /**
     Sets up the title label on the right side of the screen
     - parameter forText: text to put on the label
     */
    private func setUpRightDetailLabel(forText text: String) {
        self.detailLabel = UILabel()
        detailLabel.text = text
        detailLabel.textColor = UIColor.black
        detailLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(detailLabel)
        detailLabel.rightAnchor.constraint(equalTo: self.arrowView.leftAnchor, constant: -5).isActive = true
        detailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
    }
    
    /**
     Sets up the expand label that opens when clicking the cell
     */
    private func setUpExpandLabel() {
        self.expandLabel = UILabel()
        expandLabel.textColor = UIColor.black
        expandLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        expandLabel.translatesAutoresizingMaskIntoConstraints = false
        expandLabel.numberOfLines = 0
        expandLabel.lineBreakMode = .byWordWrapping
        addSubview(expandLabel)
        expandLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        expandLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5).isActive = true
        expandLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
        expandLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -JHTableViewCellConstants.bottomSpacing).isActive = true
    }
    

}
