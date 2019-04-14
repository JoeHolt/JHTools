//
//  UISettingActionCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/11/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

/**
 Cell with blue text for being selected
 */
class JHActionCell: UITableViewCell {
    
    // MARK: Variables

    // MARK: Inits
    
    /**
     Inits a new action cell with a given title
     - parameter title: title of cell
    */
    init(title: String) {
        super.init(style: .default, reuseIdentifier: nil)
        setUp(title: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Other
    
    /**
     Sets up the cell for a given title
     - parameter title: title of cell
    */
    private func setUp(title: String) {
        self.textLabel?.text = title
        self.textLabel?.textColor = UIColor.wiscoBlue
    }
    
}
