//
//  DefaultAPIClient.swift
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

class DefaultAPIClient:APIClient {
  
  static var shared = DefaultAPIClient()
  
 
  var caller = DefaultRequestCaller.shared
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func getUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let endpoint = "users"
    let httpMethod = RequestModel.HttpMethod.get
    
    let request = RequestModel(
      httpMethod: httpMethod,
      endpoint: endpoint,
      query: nil,
      payload: nil,
      headers: nil)
      .asURLRequest()

    return caller.call(request)
  }
}
