//
//  RequestCaller.swift
//  Alamofire
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper

public typealias MappableError = Mappable & HasErrorCode

public protocol RequestCaller {
  
  func call<ValueObject:Mappable, ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<ValueObject,ErrorObject>>
  
  func call<ValueObject:Mappable, ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<[ValueObject], ErrorObject>>
  
  func call<ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<Bool, ErrorObject>>
}
