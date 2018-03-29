//
//  ErrorModel.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import RxRetroSwift

struct ErrorModel:HasErrorCode, Codable {
  
  var errorCode: Int?
}
