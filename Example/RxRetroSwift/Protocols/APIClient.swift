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
  
  func getUsers() -> Observable<Result<[User],ErrorModel>>
}

