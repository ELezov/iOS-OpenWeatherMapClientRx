import ObjectMapper

class Wind : Mappable {
    
	var speed : Double?
	var deg : Double?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}
