//
//  APIClient.swift
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

fileprivate extension Encodable {
  var dictionaryValue:[String: Any?]? {
    guard let data = try? JSONEncoder().encode(self),
      let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      return nil
    }
    return dictionary
  }
}

class APIClient {
  
  static var shared = APIClient()
  var caller = RequestCaller.shared
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func fetchPosts() -> Observable<Result<[Post], ErrorModel>> {
    let request:URLRequest = RequestModel(
      httpMethod: .get,
      path: "posts")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func insertPost(post:Post) -> Observable<Result<Post, ErrorModel>> {
    let request = RequestModel(
      httpMethod: .post,
      path: "posts",
      payload: post.dictionaryValue)
      .asURLRequest()

    return caller.call(request)
  }
  
  func fetchComments() -> Observable<Result<[Comment], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "comments")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchAlbums() -> Observable<Result<[Album], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "albums")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchPhotos() -> Observable<Result<[Photo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "photos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchTodos() -> Observable<Result<[Todo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "todos")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func fetchUsers() -> Observable<Result<[User],ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      path: "users")
      .asURLRequest()
    
    return caller.call(request)
  }
  
  func isExist(user userId: Int) -> Observable<Result<Bool, ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      path: "users/\(userId)")
      .asURLRequest()
    return caller.execute(request)
  }
}

