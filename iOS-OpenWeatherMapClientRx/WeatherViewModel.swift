//
//  WeatherViewModel.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 06.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation
import RxSwift

class  WeatherViewModel {
    private struct Constants {
        static let URLPrefix = "http://api.openweathermap.org/data/2.5/weather?q="
        static let URLPostfix = "4264c8b0b687a575351fefb6562585e0"
    }
    
    let disposeBag = DisposeBag()
    
    var searchText = PublishSubject<String?>()
    var cityName = PublishSubject<String>()
    var degrees = PublishSubject<String>()
    
    var weather: Weather? {
        didSet {
//            if let name = weather?.name {
//                dispatch_get_main_queue().asynchronously() {
//                    self.cityName.onNext(name)
//                }
//            }
//            if let temp = weather?.degrees {
//                dispatch_get_main_queue().asynchronously() {
//                    self.degrees.onNext("\(temp) °F")
//                }
//            }
        }
    }
}
