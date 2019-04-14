//
//  UIFilterSubTableViewCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 12/21/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import UIKit

/**
 Subcell of the filter view
 */
class JHExpandableSubCell: UITableViewCell {

    // MARK: Properties
    
    internal var value: String! // value that this cell holds
    
    // MARK: Inits
    
    init(forTitle title: String, withValue value: String? = nil) {
        super.init(style: .subtitle, reuseIdentifier: "subCell")
        if let value = value {
            self.value = value
        } else {
            self.value = title
        }
        setUp(forTitle: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set up
    
    private func setUp(forTitle title: String) {
        self.textLabel?.text = title
        self.textLabel?.textColor = UIColor.wiscoFooterText
    }

}
