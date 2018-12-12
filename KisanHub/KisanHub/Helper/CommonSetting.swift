//
//  CommonSetting.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import UIKit

class CommonSetting: NSObject {
    
    static let sharedInstance = CommonSetting()
    private override init() { }
    
    let BASEURL = "https://s3.eu-west-2.amazonaws.com/interview-question-data/metoffice/"
    let EXTENTION = ".json"
    let TIME_OUT = 30.0
    
    func endPointUrl(metric: String, location: String) -> String
    {
        return BASEURL + metric + "-" + location + EXTENTION
    }
    
    func getViewControllerFromStoryBoard<T: UIViewController>(type: T.Type) -> T? {
        var fullName: String = NSStringFromClass(T.self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let range = fullName.range(of:".", options:.backwards, range:nil, locale: nil){
            fullName = String(fullName[range.upperBound...])
        }
        return storyboard.instantiateViewController(withIdentifier:fullName) as? T
    }
    
    func getViewControllerFromNib<T: UIViewController>(type: T.Type) -> T? {
        var fullName: String = NSStringFromClass(T.self)
        if let range = fullName.range(of:".", options:.backwards, range:nil, locale: nil){
            fullName = String(fullName[range.upperBound...])
        }
        return T(nibName: String(describing: fullName), bundle: nil)
    }
}





