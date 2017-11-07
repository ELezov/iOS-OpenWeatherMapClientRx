import ObjectMapper

class Weather: Mappable {
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
