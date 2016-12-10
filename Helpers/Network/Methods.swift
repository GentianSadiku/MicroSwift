//
//  Methods.swift
//  MicroSwift
//
//  Created by gentian sadiku on 12/10/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import Foundation


public typealias Parameters = [String: Any]

// HTTP methods.

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
