//
//  JsonModel.swift
//  KisanHubTest
//
//  Created by Praful Mahajan on 09/12/18.
//  Copyright © 2018 Praful Mahajan. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherData: Mappable
{
    var value: Double = 0.0
    var year: Int = 0
    var month: Int = 0

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        value       <- map["value"]
        year        <- map["year"]
        month       <- map["month"]
    }
}
