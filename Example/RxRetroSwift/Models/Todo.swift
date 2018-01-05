//
//  Todo.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper


struct Todo {
  
  var userId:Int = 0
  var id:Int = 0
  var title:String = ""
  var completed:Bool = false
}


extension Todo:Mappable {
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    
    userId        <- map["userId"]
    id            <- map["id"]
    title         <- map["title"]
    completed     <- map["completed"]
  }
}
