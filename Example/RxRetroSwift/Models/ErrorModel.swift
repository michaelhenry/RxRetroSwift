//
//  ErrorModel.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import ObjectMapper
import RxRetroSwift
import RxCocoa
import RxSwift

struct ErrorModel:HasErrorCode {
  
  var errorCode: Int = 0
}

extension ErrorModel:Mappable {
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    
  }
}
