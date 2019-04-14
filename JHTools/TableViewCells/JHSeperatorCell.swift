//
//  UIClassDisplaySeperatorCell.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/23/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit

/**
 Speerator style of a given style
 */
class JHSeperatorCell: UITableViewCell {
    
    // MARK: Styles
    
    enum style {
        case normal
        case light
    }
    
    // MARK: Instance variables
    
    private var style: JHSeperatorCell.style!
    
    // MARK: Inits

    /**
     Makes a new seperator cell with a given style
    */
    init(style: JHSeperatorCell.style) {
        super.init(style: .default, reuseIdentifier: nil)
        selectionStyle = .none
        self.style = style
        setUpSeperatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Funcs
    
    /**
     Sets up the seperator view
    */
    private func setUpSeperatorView() {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        if self.style == JHSeperatorCell.style.light {
            view.backgroundColor = UIColor(red: 232.0/255, green: 232.0/255, blue: 232.0/255, alpha: 232.0/255) // a lighter gray
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let heightConstant: CGFloat = 0.2
        let height = view.heightAnchor.constraint(equalToConstant: heightConstant)
        height.priority = UILayoutPriority.defaultLow
        height.isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.91).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
