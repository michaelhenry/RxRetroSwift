//
//  APIClient.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Foundation
import RxRetroSwift
import RxSwift
import RxCocoa

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

  lazy var caller:RequestCaller = {
    let config = URLSessionConfiguration.default
    if #available(iOS 11.0, *) {
      config.waitsForConnectivity = true
    }
    return RequestCaller(config: config)
  }()
  
  private init() {
    
    RequestModel.defaults.baseUrl = "https://jsonplaceholder.typicode.com"
  }
  
  func fetchPosts() throws -> Observable<Result<[Post], ErrorModel>> {
    let request:URLRequest = RequestModel(
      httpMethod: .get,
      path: "posts")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func insertPost(post:Post) throws -> Observable<Result<Post, ErrorModel>> {
    let request = RequestModel(
      httpMethod: .post,
      path: "posts",
      payload: post.dictionaryValue)
      .asURLRequest()

    return try caller.call(request)
  }
  
  func fetchComments() throws -> Observable<Result<[Comment], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "comments")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func fetchAlbums() throws -> Observable<Result<[Album], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "albums")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func fetchPhotos() throws -> Observable<Result<[Photo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "photos")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func fetchTodos() throws -> Observable<Result<[Todo], ErrorModel>> {
    let request = RequestModel(
      httpMethod: .get,
      path: "todos")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func fetchUsers() throws -> Observable<Result<[User],ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .get,
      path: "users")
      .asURLRequest()
    
    return try caller.call(request)
  }
  
  func deleteUser(userId:Int) throws -> Observable<Result<RawResponse,ErrorModel>> {
    
    let request = RequestModel(
      httpMethod: .delete,
      path: "users/\(userId)")
      .asURLRequest()
    
    return try caller.call(request)
  }
}

