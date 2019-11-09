//
//  extensions.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/7/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(_ superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension UILabel {
    func configureLabel(_ label: UILabel) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
}
