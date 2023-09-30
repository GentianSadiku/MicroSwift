//
//  ViewThinLine.swift
//  MicroSwift
//
//  Created by gentian sadiku on 12/2/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import UIKit

public extension UIView {
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    
    public func addLineOnBottom() {
        let bottom = UIView(frame: CGRect.init(x: 0, y: height-0.5, width: width, height: 0.5))
        addLineOn(bottom)
    }
    
    public func addLineOnTop() {
        let top = UIView(frame: CGRect.init(x: 0, y: 0, width: width, height: 0.5))
        addLineOn(top)
    }
    
    public func addLineOnRight() {
        let right = UIView(frame: CGRect.init(x: width-0.5, y: 0, width: 0.5, height: height))
        addLineOn(right)
    }
    
    public func addLineOnLeft() {
        let left = UIView(frame: CGRect.init(x: 0, y: 0, width: 0.5, height: height))
        addLineOn(left)
    }
    
    private func addLineOn(_ line: UIView) {
        line.backgroundColor = .lightGray
        self.addSubview(line)
    }
}
