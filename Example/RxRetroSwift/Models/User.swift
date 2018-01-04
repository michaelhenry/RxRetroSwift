//
//  User.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//
import Foundation
import ObjectMapper
import RxRetroSwift

struct User {
  var userId:Int = 0
  var name:String = ""
  var username:String = ""
  var email:String = ""
  var phone:String?
  var website:String?
  var company:Company?
  var address:Address?
}

extension User:Mappable {
  
  init?(map: Map) {
    if map.JSON["id"] == nil {
      return nil
    }
  }
  
  mutating func mapping(map: Map) {
    
    userId <- map["id"]
    name <- map["name"]
    username <- map["username"]
    email <- map["email"]
    phone <- map["phone"]
    website <- map["website"]
    company <- map["company"]
    address <- map["address"]
  }
}
