//
//  UIVIew+Rotate.swift
//  Tale
//
//  Created by gentian sadiku on 7.10.21.
//

import UIKit

extension UIView {
    func rotate(degree: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: CGFloat(Double(degree) * .pi/180))
    }
}
