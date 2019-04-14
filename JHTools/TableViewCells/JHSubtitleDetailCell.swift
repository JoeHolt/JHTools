//
//  WECourseTableViewCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 10/30/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import UIKit

/**
 Displays a course
 */
public class JHSubtitleDetailCell: UITableViewCell {
    
    // MARK: Static fields

    // MARK: Instanse fields
    
    private let mainTitleText: String!
    private let subtitleText: String!
    private let detail: String!
    private var detailLabel: UILabel!
    
    // MARK: Inits
    
    /**
     Inits a table view cell given certain data
     - parameter courseName: string of name of the course to be displayed
     - parameter courseDescription: string of description of the course to be displayed
     - parameter creditRange: string representing the credit range of this course
    */
    public init(titleText name: String, subtitleText subtitle: String, detailedText detail: String) {
        // Set instance fields
        self.mainTitleText = subtitle
        self.subtitleText = name
        self.detail = detail
        // Init super class
        super.init(style: .subtitle, reuseIdentifier: nil)
        // Other set up
        //accessoryType = .disclosureIndicator
        // Set up the cell
        addDetailView(withText: detail)
        setUpTitles(forTitle: mainTitleText, forDescription: subtitleText, forDetail: detail)
    }
    
    /**
     Inits a table view cell from memory. Not implemented; throw fatalError
     - parameter coder: coder of which to code the cell
    */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    // MARK: User Interface
    
    /**
     Sets up the title/subtitle of the cell
     - parameter forCourseTitle: title of course
     - parameter forCourseDescription: description of course
     - parameter forCredits: credits of course
    */
    private func setUpTitles(forTitle title: String, forDescription description: String, forDetail detail: String) {
        self.textLabel?.text = title
        self.textLabel?.textColor = UIColor.wiscoBodyText
        self.textLabel?.adjustsFontSizeToFitWidth = false
        //self.textLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50).isActive = true
        self.detailTextLabel?.text = description
        self.detailTextLabel?.textColor = UIColor.wiscoFooterText
    }
    
    /**
     Adds a new view for displaying the credits of a class in the cell's accessorry view
    */
    private func addDetailView(withText text: String) {
        detailLabel = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        detailLabel.text = " \(text)"
        detailLabel.textAlignment = .right
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.textColor = UIColor.wiscoFooterText
        detailLabel.sizeToFit()
        accessoryView = detailLabel
        addSubview(detailLabel)
        detailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        detailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
}
