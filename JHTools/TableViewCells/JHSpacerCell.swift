//
//  UIClassDisplaySpacerCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/29/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Cell used as a spacer for testing purposes
 */
public class JHSpacerCell: UITableViewCell {

    /**
     Inits cell of given height
    */
    init(ofHeight height: CGFloat) {
        super.init(style: .default, reuseIdentifier: nil)
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        backgroundColor = UIColor.darkBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
