//
//  HasErrorCode.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//

import Foundation

public protocol HasErrorInfo {
  
  var errorCode:Int? { get set }
  var errorDetail:String? { get set }
  
  init()
}
