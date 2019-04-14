//
//  SegueFromLeft.swift
//  WiscEnroll
//
//  Created by Joe Holt on 12/22/18.
//  Copyright © 2018 Joe Holt. All rights reserved.
//

import UIKit

// https://stackoverflow.com/questions/30763519/ios-segue-left-to-right/31411862

class SegueFromLeft: UIStoryboardSegue {
    override func perform()
    {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.50, delay: 0.0, options: [.curveEaseInOut], animations: {
                dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { finished in
                src.present(dst, animated: false, completion: nil)
            }
        )
    }
}
