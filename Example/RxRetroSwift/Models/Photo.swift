//
//  Photo.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper


struct Photo {
  
  var albumId:Int = 0
  var id:Int = 0
  var title:String = ""
  var url:String = ""
  var thumbnailUrl:String = ""
}

extension Photo:Mappable {
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    
    albumId       <- map["userId"]
    id            <- map["id"]
    title         <- map["title"]
    url           <- map["url"]
    thumbnailUrl  <- map["thumbnailUrl"]
  }
}

