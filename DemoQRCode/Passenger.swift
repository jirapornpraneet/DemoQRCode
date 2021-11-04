//
//  Passenger.swift
//  DemoQRCode
//
//  Created by iOS Dev on 4/11/2564 BE.
//

import Foundation
import ObjectMapper

class Passenger: NSObject, Mappable {
    
    var id = ""
    var prefix = ""
    var fullName = ""
    var countryCode = ""
    var phoneNumber = ""
    
    var prefixId = 0
    var countryCodeId = 0
    
    override init() {}
    required init?(map: Map) {}
    func mapping(map: Map) {
        id <- map["id"]
//        prefix <- map["prefix"]
//        fullName <- map["fullName"]
//        countryCode <- map["countryCode"]
//        phoneNumber <- map["phoneNumber"]
//
//        prefixId <- map["prefixId"]
//        countryCodeId <- map["countryCodeId"]
    }
}

