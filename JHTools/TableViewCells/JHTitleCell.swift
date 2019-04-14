//
//  UIClassDiesplayTitleCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/23/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

public protocol JHTitleCellDelegate {
    func didTapSeeAll(_ sender: JHTitleCell)
}

/**
 A title cell with a button "see all" button
 */
public class JHTitleCell: UITableViewCell {

    // MARK: Instance Variables
    
    public var delegate: JHTitleCellDelegate!
    private var titleName: String!
    internal var largeTitleLabel: UILabel!
    private var seeAllButton: UIButton!
    
    // MARK: Inits
    
    init(title titleName: String, fontSize: CGFloat, backgroundStyle: UIBackgroundType = .light, withViewAllButton viewAll: Bool = false, buttonTitle: String = "Edit") {
        super.init(style: .default, reuseIdentifier: nil)
        // set to darkbackground if desired
        if backgroundStyle == .dark {
            self.backgroundColor = UIColor.darkBackground
        }
        self.titleName = titleName
        selectionStyle = .none
        setUpLabel(fontSize: fontSize)
        // button for seeing all
        if viewAll {
            setUpButton(withText: buttonTitle)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Funcs
    
    /**
     Sets up the button that enables the user to see an expanded view
    */
    private func setUpButton(withText text: String) {
        seeAllButton = UIButton()
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.setTitle(text, for: .normal)
        seeAllButton.setTitleColor(UIColor.actionBlue, for: .normal)
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        seeAllButton.titleLabel?.textAlignment = .right
        seeAllButton.isUserInteractionEnabled = true
        seeAllButton.addTarget(self, action: #selector(didTapSeeAllButton), for: .touchDown)
        addSubview(seeAllButton)
        seeAllButton.bottomAnchor.constraint(equalTo: self.largeTitleLabel.bottomAnchor).isActive = true
        seeAllButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }
    
    /**
     Called when tapping the see all button
    */
    @objc private func didTapSeeAllButton() {
        delegate.didTapSeeAll(self)
    }
    
    /**
     Sets up the title label
    */
    private func setUpLabel(fontSize: CGFloat) {
        largeTitleLabel = UILabel()
        largeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        largeTitleLabel.text = titleName
        largeTitleLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        largeTitleLabel.textColor = UIColor.black
        addSubview(largeTitleLabel)
        largeTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        largeTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: JHTableViewCellConstants.rightSpacing).isActive = true
        largeTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
        largeTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -JHTableViewCellConstants.bottomSpacing * 0.0).isActive = true // because header cells never have a seperator bellow them, we zero out the spacing constant
    }

}
