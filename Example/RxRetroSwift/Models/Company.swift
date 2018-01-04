//
//  Company.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper
import RxRetroSwift

struct Company {
  
  var name:String = ""
  var catchPhrase:String = ""
  var bs:String = ""
}

extension Company:Mappable {
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    
    name <- map["name"]
    catchPhrase <- map["catchPhrase"]
    bs <- map["bs"]
  }
}
