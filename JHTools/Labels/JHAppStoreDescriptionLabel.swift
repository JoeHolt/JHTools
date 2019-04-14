//
//  UIAppStoreDescriptionLabel.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Class representing the label that is shown next to the download button on the store
*/
public class JHAppStoreDescriptionLabel: UILabel {

    // MARK: Instance variables
    
    init(withTitle title: String) {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = UIColor.lightGray
        font = UIFont.systemFont(ofSize: 10)
        numberOfLines = 2
        text = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Inits
    
    // MARK: Other functions

}
