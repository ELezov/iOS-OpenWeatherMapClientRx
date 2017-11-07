//
//  Endpoint.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 07.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation
import Alamofire

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var fullURL: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters { get }
}

extension Endpoint {
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    var fullURL: String {
        return baseURL + path
    }
}
