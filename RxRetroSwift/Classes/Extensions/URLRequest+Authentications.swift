//
//  URLRequest+Authentications.swift
//  RxRetroSwift
//
//  Created by Michael Pantaleon on 2018/01/15.
//

import Foundation

extension URLRequest {
  
  mutating func authenticate(token :String) {
    
    setValue("Token \(token)", forHTTPHeaderField: "Authorization")
  }
}
