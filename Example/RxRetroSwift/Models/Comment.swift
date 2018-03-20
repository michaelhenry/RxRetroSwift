//
//  Comment.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper


struct Comment:Codable {
  
  var postId:Int = 0
  var id:Int = 0
  var email:String = ""
  var body:String = ""
}

