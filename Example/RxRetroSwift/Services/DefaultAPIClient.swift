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
  
  func getPosts() -> Observable<Result<[Post], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "posts")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getComments() -> Observable<Result<[Comment], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "comments")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getAlbums() -> Observable<Result<[Album], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "albums")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getPhotos() -> Observable<Result<[Photo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "photos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getTodos() -> Observable<Result<[Todo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "todos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func getUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      endpoint: "users")
      .asURLRequest()

    return caller.call(request)
  }
}
