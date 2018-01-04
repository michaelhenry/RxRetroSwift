//
//  Address.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper
import RxRetroSwift

struct Address {
 
  var street:String = ""
  var suite:String = ""
  var city:String = ""
  var zipcode:String?
}

extension Address:Mappable {
  
  init?(map: Map) {
  
  }
  
  mutating func mapping(map: Map) {
    
    street <- map["street"]
    suite <- map["suite"]
    city <- map["city"]
    zipcode <- map["zipcode"]
  }
}
