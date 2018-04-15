//
//  RawResponse.swift
//  Nimble
//
//  Created by Michael Pantaleon on 2018/03/28.
//

import Foundation

public struct RawResponse {
  
  public var statusCode:Int
  public var data:Data?
  
  init(statusCode:Int, data:Data?) {
    self.statusCode = statusCode
    self.data       = data
  }
}
