//
//  Network.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 07.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation

import  Alamofire

protocol NetworkErrorHandler {
    func networkRequest(request: URLRequest, error: Error)
}

typealias ResponseClosure = ((DataResponse<Any>) -> Void)

struct Network {
    let manager: SessionManager = SessionManager()
    static let shared = Network()
    var delegate: NetworkErrorHandler?
}

extension Network {
    func request(endpoint: Endpoint, comletion: @escaping ResponseClosure) -> Request {
        let request = manager.request(endpoint.fullURL, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).responseJSON { response in
            if response.result.isSuccess {
                print(response.result.value)
                //debugPrint(response.result.description)
            } else {
                debugPrint(response.result.error ?? "Error")
                if let urlRequest = response.request,
                    let error = response.result.error {
                    self.delegate?.networkRequest(request: urlRequest, error: error)
                }
            }
            comletion(response)
        }
        print(request.description)
        return request
    }
    
//    func requestRx(endpoint: Endpoint/*, comletion: @escaping ResponseClosure*/) -> Request {
//        let request = manager.request(endpoint.fullURL, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).rx.json() { response in
//            if response.result.isSuccess {
//                debugPrint(response.result.description)
//            } else {
//                debugPrint(response.result.error ?? "Error")
//                if let urlRequest = response.request,
//                    let error = response.result.error {
//                    self.delegate?.networkRequest(request: urlRequest, error: error)
//                }
//            }
//            //comletion(response)
//        }
//        print(request.description)
//        return request
//    }

}
