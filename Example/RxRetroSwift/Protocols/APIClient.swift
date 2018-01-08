//
//  APIClient.swift
//  RxRetroSwift_Example
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//
import RxSwift
import RxCocoa
import RxRetroSwift


protocol APIClient {
  
  func getPosts()     -> Observable<Result<[Post],ErrorModel>>
  func insertPost(post:Post) -> Observable<Result<Post,ErrorModel>>
  
  func getComments()  -> Observable<Result<[Comment],ErrorModel>>
  func getAlbums()    -> Observable<Result<[Album],ErrorModel>>
  func getPhotos()    -> Observable<Result<[Photo],ErrorModel>>
  func getTodos()     -> Observable<Result<[Todo],ErrorModel>>
  func getUsers()     -> Observable<Result<[User],ErrorModel>>
}

