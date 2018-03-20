//
//  Address.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation

struct Address:Codable {
 
  var street:String = ""
  var suite:String = ""
  var city:String = ""
  var zipcode:String?
}
