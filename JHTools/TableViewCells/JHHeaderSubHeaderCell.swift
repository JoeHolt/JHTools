//
//  WEClassDisplayHeader.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/23/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Cell with a header and subheader field
 */
public class JHHeaderSubHeaderCell: UITableViewCell {

    // MARK: Instance variables
    
    private var headerTitle: String!
    private var headerSubtitle: String!
    private var preferedHeight: CGFloat!
    private var headerTitleLabel: UILabel!
    private var headerSubTitleLabel: UILabel!
    
    // MARK: Init
    
    init(title: String, subtitle: String, headerSize: CGFloat = 30.0, subHeaderSize: CGFloat = 20.0) {
        super.init(style: .default, reuseIdentifier: nil)
        self.headerTitle = title
        self.headerSubtitle = subtitle
        selectionStyle = .none
        setUpHeaderTitleLabel(withFontSize: headerSize)
        setUpHeaderSubTitleLabel(withFontSize: subHeaderSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Funcs
    
    /**
     Sets up the header title label
    */
    private func setUpHeaderTitleLabel(withFontSize size: CGFloat) {
        self.headerTitleLabel = UILabel()
        headerTitleLabel.text = headerTitle
        headerTitleLabel.font = UIFont.systemFont(ofSize: size, weight: .bold)
        headerTitleLabel.numberOfLines = 0
        headerTitleLabel.lineBreakMode = .byWordWrapping
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerTitleLabel)
        headerTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        headerTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
        headerTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }
    
    /**
     Sets up the header subtitle label
    */
    private func setUpHeaderSubTitleLabel(withFontSize size: CGFloat) {
        self.headerSubTitleLabel = UILabel()
        headerSubTitleLabel.text = headerSubtitle.lowercased().capitalizingFirstLetter(splitBy: " ")
        headerSubTitleLabel.font = UIFont.systemFont(ofSize: size, weight: .light)
        headerSubTitleLabel.textColor = UIColor.gray
        headerSubTitleLabel.numberOfLines = 0
        headerSubTitleLabel.lineBreakMode = .byWordWrapping
        headerSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerSubTitleLabel)
        headerSubTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        headerSubTitleLabel.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 0).isActive = true
        headerSubTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -JHTableViewCellConstants.bottomSpacing * 0).isActive = true // because there is no seperator bellow the subtitle, we zero out the constant
        headerSubTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }
    
}
