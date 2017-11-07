import RxSwift
import ObjectMapper
import Alamofire
import RxCocoa
import RxAlamofire

class  WeatherViewModel {
    let networkManager: NetworkManager?
    
    let disposeBag = DisposeBag()
    
    var searchText = BehaviorSubject<String>(value: "Калининград")
    var cityName = BehaviorSubject<String>(value: "")
    var degrees = BehaviorSubject<String>(value: "")
    var wind = BehaviorSubject<String>(value: "")
    var descriptionLabel = BehaviorSubject<String>(value: "")
    
    
    var weather: WeatherResult? {
        didSet {
            if let name = weather?.name {
                DispatchQueue.main.async {
                    self.cityName.onNext(name)
                }
                print(name)
            }
            if let temp = weather?.main?.temp {
                DispatchQueue.main.async {
                    self.degrees.onNext("\(temp) °C")
                }
            }
            if let wind = weather?.wind?.speed{
                DispatchQueue.main.async {
                    self.wind.onNext("\(wind) m/s")
                }
            }
            if let description = weather?.weather?[0].description{
                DispatchQueue.main.async {
                    self.descriptionLabel.onNext(description)
                }
            }
        }
    }
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        let jsonRequest = searchText.map { text in
            return Network.shared.request(endpoint: WeatherService.getWeatherInfo(query: text)){ response in
                response.result.ifSuccess {
                    self.weather = Mapper<WeatherResult>().map(JSONObject: response.result.value)
                }
            }
        }.subscribe()
        .addDisposableTo(disposeBag)
    }
}

