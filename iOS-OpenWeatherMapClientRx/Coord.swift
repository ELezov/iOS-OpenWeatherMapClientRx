import ObjectMapper

class Coord : Mappable {
	var lon : Double?
	var lat : Double?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }

	
}
