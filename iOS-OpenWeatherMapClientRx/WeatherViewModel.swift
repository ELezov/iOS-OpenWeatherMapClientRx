//
//  WeatherViewModel.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 06.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import RxSwift
import ObjectMapper
import Alamofire
import RxCocoa
import RxAlamofire

class  WeatherViewModel {
    private struct Constants {
        static let URLPrefix = "http://api.openweathermap.org/data/2.5/weather?q="
        static let URLPostfix = "4264c8b0b687a575351fefb6562585e0"
    }
    
    let networkManager: NetworkManager?
    
    let disposeBag = DisposeBag()
    
    var searchText = BehaviorSubject<String>(value: "")
    var cityName = BehaviorSubject<String>(value: "Unknown")
    var degrees = BehaviorSubject<String>(value: "")
    
    var weather: Weather? {
        didSet {
            if let name = weather?.name {
                DispatchQueue.main.async {
                    self.cityName.onNext(name)
                }
                print(name)
            }
            if let temp = weather?.degrees {
                DispatchQueue.main.async {
                    self.degrees.onNext("\(temp) °F")
                }
            }
        }
    }
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        let jsonRequest = searchText.map { text in
            return Network.shared.request(endpoint: WeatherService.getWeatherInfo(query: text)){ response in
                response.result.ifSuccess {
                    self.weather = Mapper<Weather>().map(JSONObject: response.result.value)
                }
            }
        }.subscribe()
        .addDisposableTo(disposeBag)
    }
}

