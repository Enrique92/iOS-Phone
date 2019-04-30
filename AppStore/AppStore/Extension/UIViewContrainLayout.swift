//
//  UIViewContrainLayout.swift
//  AppStore
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

extension UIView {
    func matchParent(padding: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.top).isActive = true
        }
        
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leftAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.rightAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}
