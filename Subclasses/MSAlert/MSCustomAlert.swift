//
//  ViewThinLine.swift
//  MicroSwift
//
//  Created by gentian sadiku on 12/2/16.
//  Copyright © 2016 Gentian Sadiku. All rights reserved.
//

import UIKit

public class MSCustomAlert: NSObject {
    

    public class func showAlertWith(message: String, onViewController: UIViewController){
        
        let alert = UIAlertController(title: "App Name", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let actionButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(actionButton)
        
        onViewController.present(alert, animated: true, completion: nil)
    }
    
}

