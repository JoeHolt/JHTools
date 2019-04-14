//
//  UIClassDisplayStatisticsCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Cell holding a collection of statistics to be displayed in large font
 */
class JHStatisticsCollectionCell: UITableViewCell {

    // MARK: Instance Variables
    
    private var stackView: UIStackView!
    
    // MARK: Init
    
    init(statView views: [JHStatDisplayLabel]) {
        super.init(style: .default, reuseIdentifier: nil)
        selectionStyle = .none
        setUpStackView()
        for view in views {
            stackView.addArrangedSubview(view)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Other Functions
    
    /**
     Sets up the stack view
    */
    private func setUpStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        addSubview(stackView)
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing * 2.5).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: JHTableViewCellConstants.leftSpacing * 2.5).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
