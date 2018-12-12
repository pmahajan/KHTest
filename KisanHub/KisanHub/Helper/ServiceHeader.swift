//
//  ServiceHeader.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import Foundation

public struct HEADERS {
    static let urlEncoded : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8","Accept":"application/json; charset=UTF-8","cache-control": "no-cache"])
    static let appJson : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-Type":"application/json; charset=UTF-8", "Accept":"application/json; charset=UTF-8","cache-control": "no-cache"])
    static let multipart : NSMutableDictionary = NSMutableDictionary.init(dictionary: ["Content-type": "multipart/form-data"])
}

