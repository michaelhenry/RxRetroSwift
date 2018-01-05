//
//  Album.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper


struct Album {
  
  var userId:Int = 0
  var id:Int = 0
  var title:String = ""
}

extension Album:Mappable {
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    userId  <- map["userId"]
    id      <- map["id"]
    title   <- map["title"]
  }
}
