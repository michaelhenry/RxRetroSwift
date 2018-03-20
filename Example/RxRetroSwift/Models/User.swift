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

struct User:Codable {
  var id:Int = 0
  var name:String = ""
  var username:String = ""
  var email:String = ""
  var phone:String?
  var website:String?
  var company:Company?
  var address:Address?
}

