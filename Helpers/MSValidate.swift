//
//  Validate.swift
//  MicroSwift
//
//  Created by gentian sadiku on 12/3/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import Foundation

public class MSValidate {
    
    // MARK: - Properties
    public let minCharCountForName = 6
    public let minCharCountForPassword = 6
    
    
    public func email(_ email:String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    public func password(_ password: String) -> String {
        
        var errorMessage = ""
        
        if password.contains(" ") {
            errorMessage = "Password should not contain empty spaces."
            return errorMessage
        }
        
        if password.characters.count < minCharCountForPassword {
            errorMessage = "Password should be more than \(minCharCountForPassword - 1) characters."
            return errorMessage
        }
        
        return errorMessage
    }
    
    public func phone(number:String) -> String {
        var errorMessage = ""
        
        let charcter  = NSCharacterSet(charactersIn: "+0123456789").inverted
        var filtered: String!
        let inputString = number.components(separatedBy:charcter)
        filtered = inputString.joined(separator: "")
        
        if number != filtered {
            errorMessage = "Please type a valid number, for examle +0123456789)"
        }
        
        return errorMessage
    }
    
    
}

