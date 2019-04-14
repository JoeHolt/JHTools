//
//  UIClassDisplayButtonCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

enum UIClassDisplayButtonCellDisplayType {
    case save
    case remove
}

/**
 A cell with a save button and elipsis, similar to the app store
*/
class JHSaveElipsisButtonCell: UITableViewCell, JHAppStoreButtonDelegate {
    
    // MARK: Static methods

    // MARK: Instanse variables
    
    internal var displayType: UIClassDisplayButtonCellDisplayType!
    internal var delegate: JHAppStoreButtonDelegate!
    private var ellipseButton: JHEllipseButton!
    private var saveButton: JHAppStoreButton!
    private var saveDetailLabel: JHAppStoreDescriptionLabel!
    
    // MARK: Inits
    
    /**
     Inits a new cell that has a save and elipse button
    */
    init(displayType: UIClassDisplayButtonCellDisplayType, delegate: JHAppStoreButtonDelegate) {
        super.init(style: .default, reuseIdentifier: nil)
        self.delegate = delegate
        self.displayType = displayType
        selectionStyle = .none
        setUpElipseButton()
        setUpSaveButton()
        setUpSaveDetailLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: AppStoreButtonDelegate
    
    internal func didTapAppStoreButton(withStyle style: JHAppStoreButtonStyle) {
        // tell responding classes
        delegate.didTapAppStoreButton(withStyle: style)
        // update style of button and its detail label
        if style == .remove {
            self.saveButton.setButtonStyle(.save)
            self.saveDetailLabel.text = JHAppStoreButtonStyle.save.rawValue
        } else {
            self.saveButton.setButtonStyle(.remove)
            self.saveDetailLabel.text = JHAppStoreButtonStyle.remove.rawValue
            
        }
    }
    
    // MARK: Functions
    
    /**
     Sets up the elipse button on the right of the cell
    */
    private func setUpElipseButton() {
        ellipseButton = JHEllipseButton()
        addSubview(ellipseButton)
        //ellipseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ellipseButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ellipseButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
        ellipseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
    }
    
    /**
     Sets up the save button that saves the class
    */
    private func setUpSaveButton() {
        if self.displayType == UIClassDisplayButtonCellDisplayType.save {
            saveButton = JHAppStoreButton(style: .save)
        } else {
            saveButton = JHAppStoreButton(style: .remove)
        }
        saveButton.delegate = self
        addSubview(saveButton)
        saveButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        saveButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing).isActive = true
        saveButton.topAnchor.constraint(equalTo: self.topAnchor, constant: JHTableViewCellConstants.topSpacing).isActive = true
    }
    
    /**
     Sets up a detail label for the save button
    */
    private func setUpSaveDetailLabel() {
        if self.displayType == UIClassDisplayButtonCellDisplayType.save {
            saveDetailLabel = JHAppStoreDescriptionLabel(withTitle: "Save Course \nfor Later")
        } else {
            saveDetailLabel = JHAppStoreDescriptionLabel(withTitle: "Unsave Course \nfor Later")
        }
        addSubview(saveDetailLabel)
        saveDetailLabel.leftAnchor.constraint(equalTo: self.saveButton.rightAnchor, constant: 5).isActive = true
        saveDetailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        saveDetailLabel.heightAnchor.constraint(equalTo: self.saveButton.heightAnchor, multiplier: 0.8).isActive = true
    }

}
