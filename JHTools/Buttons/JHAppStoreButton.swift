//
//  UIAppStoreButton.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

enum JHAppStoreButtonStyle: String {
    case save = "Add Course\nto Cart"
    case remove = "Remove Course\nfrom Cart"
}

protocol JHAppStoreButtonDelegate {
    func didTapAppStoreButton(withStyle style: JHAppStoreButtonStyle)
}

/**
 A class respresenting a button that says "save" similar to the app store download button
*/
class JHAppStoreButton: UIButton {
    
    // MARK: Static
    
    // MARK: Instance Variables
    
    internal var delegate: JHAppStoreButtonDelegate!
    private var buttonBackgroundColor: UIColor!
    private var style: JHAppStoreButtonStyle!
    
    // MARK: Inits
    
    init(style: JHAppStoreButtonStyle = .save) {
        super.init(frame: CGRect.zero)
        self.style = style
        setButtonStyle(style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = UIColor.lightGray
        delegate.didTapAppStoreButton(withStyle: self.style)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = buttonBackgroundColor
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = buttonBackgroundColor
    }
    
    // MARK: Functions
    
    /**
     Sets up the button with given title and style
     - parameter forTitle: title to put on the button
     - parameter withStyle: style of button
    */
    internal func setButtonStyle(_ style: JHAppStoreButtonStyle) {
        self.style = style
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13.0, weight: .bold)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        switch style {
        case .save:
            self.buttonBackgroundColor = UIColor.actionBlue
            self.backgroundColor = self.buttonBackgroundColor
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitle("SAVE", for: .normal)
        case .remove:
            buttonBackgroundColor = UIColor.grayBackground
            backgroundColor = buttonBackgroundColor
            setTitleColor(UIColor.actionBlue, for: .normal)
            setTitle("REMOVE", for: .normal)
        }
        
    }

}
