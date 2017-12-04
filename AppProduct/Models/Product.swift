//
//  Product.swift


import Foundation
import ObjectMapper

class Product: Mappable {
    
    var value : String?
    var currency : String?
    var title : String?
    var en_description : String?
    var fr_description : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        value           <- map["value"]
        currency        <- map["currency"]
        title           <- map["title"]
        en_description  <- map["description.en-CA"]
        fr_description  <- map["description.fr-CA"]
    }
    
    static func getDescription(from product: Product) -> String {
        let preferredLanguage = NSLocale.preferredLanguages[0]
        switch preferredLanguage {
        case "fr-CA":
            return product.fr_description!
        default:
            return product.en_description!
        }
    }
}


class data: Mappable {
    
    var products : [Product]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        products  <- map["data"]
    }
}
