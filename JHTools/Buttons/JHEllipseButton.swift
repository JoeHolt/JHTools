//
//  UIEllipseButton.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 A class representing a button with a blue background and three dots for the elipse
 */
public class JHEllipseButton: UIButton {
    
    // MARK: Instance variables
    
    // MARK: Inits

    /**
     Makes a circle button with a blue background and three dots for the title
    */
    init() {
        super.init(frame: CGRect.zero)
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setImage(UIImage(named: "elipsis"), for: .normal)
        self.imageView?.tintColor = UIColor.white
        self.backgroundColor = UIColor.actionBlue
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = UIColor.lightGray
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = UIColor.actionBlue
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = UIColor.actionBlue
    }
    
    // MARK: Functions
    
}
