//
//  UIFilterHeaderTableViewCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 12/21/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import UIKit

/**
 Displays a header cell 
 */
public class JHExpandableHeaderCell: UITableViewCell {
    
    // MARK: Properties
    
    internal var isExpanded: Bool!
    internal var subCells: [JHExpandableSubCell]!
    internal var propertyIdentifier: String!    // identifier for filter this sets
    private var nFilters: Int = 0
    private var rightDetailLabel: UILabel!
    
    // MARK: TableViewCell Delegate

    /**
     Inits with given subsells and title
    */
    init(withSubcells subCells: [JHExpandableSubCell], _ title: String, propertyIdentifier id: String) {
        super.init(style: .subtitle, reuseIdentifier: "headerCell")
        
        self.subCells = subCells
        self.isExpanded = false
        self.propertyIdentifier = id
        self.detailTextLabel?.textColor = UIColor.wiscoFooterText
        
        setUpRightDetailLabel()
        
        setUp(forTitle: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setters
    
    /**
     Updates the right and sub detail labels
    */
    internal func updatedDetailLabels() {
        self.detailTextLabel?.text = JHExpandableHeaderCell.getActiveSubcellDescription(forHeaderCell: self)
        updateNumberFiltersLabel()
    }
    
    // MARK: Set up
    
    /**
     Updates the number active filters label
    */
    private func updateNumberFiltersLabel() {
        self.rightDetailLabel?.text = String(JHExpandableHeaderCell.getNumberFilters(forHeaderCell: self))
    }
    
    /**
     Sets the necesssary titles
    */
    private func setUp(forTitle title: String) {
        self.textLabel?.text = title
        self.textLabel?.textColor = UIColor.wiscoBodyText
    }
    
    private func setUpRightDetailLabel() {
        rightDetailLabel = UILabel()
        rightDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        rightDetailLabel.textColor = UIColor.wiscoFooterText
        rightDetailLabel.text = "TEST"
        addSubview(rightDetailLabel)
        rightDetailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightDetailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -JHTableViewCellConstants.rightSpacing).isActive = true
    }
    
    // MARK: Statics
    
    /**
     Gets the number of filters for a given header cell
     - parameter forHeaderCell: Cell to get filter count from
     - returns: number of filters for header cell
     */
    static internal func getNumberFilters(forHeaderCell header: JHExpandableHeaderCell) -> Int {
        var count = 0
        for sub in header.subCells {
            if sub.accessoryType == .checkmark {
                count += 1
            }
        }
        return count
    }
    
    /**
     Returns the active subcell title as a string
     - parameter forHeaderCell: header cell to check for
     - returns: string representing active subcell
    */
    static internal func getActiveSubcellDescription(forHeaderCell header: JHExpandableHeaderCell) -> String {
        var titles: [String] = []
        // get all active categories
        for cell in header.subCells {
            if cell.accessoryType == .checkmark {
                titles.append(cell.textLabel!.text!)
            }
        }
        // if none, return all
        if titles.count == 0 {
            return "All"
        }
        // else makea string with all values
        var str = ""
        for title in titles {
            str.append(title)
            if title != titles.last! {
                str.append(", ")
            }
        }
        return str
    }

}
