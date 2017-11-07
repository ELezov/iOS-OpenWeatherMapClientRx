import ObjectMapper

class Clouds : Mappable {
	var all : Int?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        all <- map["all"]
    }

}
