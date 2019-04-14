//
//  UIStatDisplayLabel.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/27/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 A view representing the stat display label in the app store
 */
public class JHStatDisplayLabel: UIView {

    // MARK: Instanse Variables
    
    private var dataLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    // MARK: Inits
    
    /**
     Inits new view with given data
     - parameter forData: data to display
     - parameter description: of statistic
    */
    init(forData data: String, description: String) {
        super.init(frame: CGRect.zero)
        setUpDataLabel(forData: data)
        setUpDescriptionLabel(forDescription: description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Other functions
    
    /**
     Sets up the label that shows the data in big text
     - parameter forData: data to display
    */
    private func setUpDataLabel(forData data: String) {
        dataLabel = UILabel()
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.text = data
        dataLabel.textColor = UIColor.gray
        dataLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        addSubview(dataLabel)
        dataLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dataLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    /**
     Sets up the stats view description label
     - parameter forDescription: description to put up
    */
    private func setUpDescriptionLabel(forDescription desc: String) {
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = desc
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -JHTableViewCellConstants.bottomSpacing * 0.8).isActive = true
    }

}
