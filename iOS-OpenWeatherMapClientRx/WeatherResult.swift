import ObjectMapper

class WeatherResult : Mappable {
	var coord : Coord?
	var weather : [Weather]?
	var base : String?
	var main : Main?
	var visibility : Int?
	var wind : Wind?
	var clouds : Clouds?
	var dt : Int?
	var sys : Sys?
	var id : Int?
	var name : String?
	var cod : Int?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }

	
}
