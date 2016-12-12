//
//  Dictionary+MicroSwift.swift
//  ExampleMicroSwift
//
//  Created by gentian sadiku on 12/12/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import Foundation


extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        
        var parametersString = ""
        
        for (key, value) in self {
            parametersString += "&\(key)=\(value)"
        }
        
        return parametersString
    }
    
}
