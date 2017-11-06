//
//  Weather.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 06.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    
    var name: String?
    var degrees: Double?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        degrees <- map["main"]["temp"]
    }
}
