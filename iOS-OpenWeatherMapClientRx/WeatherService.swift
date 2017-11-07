//
//  WeatherService.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 07.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation
import Alamofire

enum WeatherService {
    case getWeatherInfo(query: String)
}

extension WeatherService: Endpoint {
    
    var parameters: Parameters {
        switch self {
            case .getWeatherInfo(let query):
                return ["q" : query,
                        "APPID" : APP_ID,
                        "units" : "metric",
                        "lang" : "ru"]
        }
    }

    
    var headers: HTTPHeaders {
        return ["Authorization": ""]
    }

    
    var method: HTTPMethod {
        switch self {
            case .getWeatherInfo: return .get
        }
    }

    var path: String {
        switch  self {
            case .getWeatherInfo: return PATH_WEATHER_URL
        }
    }

    
    var baseURL: String {
        return BASE_URL
    }

    
}
