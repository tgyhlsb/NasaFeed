//
//  UIView+AutoLayout.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

extension UIView {
    
    public func layoutToFillSuperView() {
        guard let superview = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let views = ["self": self]
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[self]|", options: .directionLeadingToTrailing, metrics: nil, views: views))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[self]|", options: .directionLeadingToTrailing, metrics: nil, views: views))
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
}
