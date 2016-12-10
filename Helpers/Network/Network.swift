//
//  Network.swift
//  MicroSwift
//
//  Created by gentian sadiku on 12/9/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import Foundation

class Network {
    
    public class func make(request: NSMutableURLRequest, method: HTTPMethod, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if let data = data {
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else { return completion(false, json as AnyObject?) }
                completion(true, json as AnyObject?)
            }
        }.resume()
    }
    
    public class func get(with request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        make(request: request, method: HTTPMethod.get, completion: completion)
    }
    
    public class func get(with url: URL, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        make(request: NSMutableURLRequest(url: url), method: HTTPMethod.get, completion: completion)
    }
    
    public class func post(with request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        make(request: request, method: HTTPMethod.post, completion: completion)
    }
    
    public class func put(with request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        make(request: request, method: HTTPMethod.put, completion: completion)
    }
    
}

