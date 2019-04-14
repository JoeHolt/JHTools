//
//  UISettingBoolCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/11/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

protocol JHSettingCellUpdateDelegate {
    func switchDidChangeValue(sender: UISwitch)
}

/**
 Class representing a cell with a Boolean setting
 */
class JHSettingBoolCell: UITableViewCell {
    
    // MARK: Variables
    
    internal var delegate: JHSettingCellUpdateDelegate?

    // MARK: Inits
    
    /**
     Inits a new cell with a given title and default switch value
     - parameter title: title of cell
     - parameter value: default switch value
    */
    init(title: String, value: Bool) {
        super.init(style: .default, reuseIdentifier: nil)
        setUp(title: title, value: value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set Up
    
    /**
     Sets up the cell UI
     - parameter title: title of cell
     - parameter value: default switch value
    */
    private func setUp(title: String, value: Bool) {
        self.textLabel?.text = title
        self.selectionStyle = .none
        let swtch = UISwitch()
        swtch.isOn = value
        swtch.addTarget(self, action: #selector(switchDidChange(sender:)), for: .valueChanged)
        self.accessoryView = swtch
    }
    
    // MARK: Callbacks
    
    @objc private func switchDidChange(sender: UISwitch!) {
        delegate?.switchDidChangeValue(sender: sender)
    }

}
