//
//  DefaultRequestCaller.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import ObjectMapper

public class DefaultRequestCaller:RequestCaller {
  
  public static var shared = DefaultRequestCaller()
  
  private init() {}
  
  public func call<ValueObject:Mappable,ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<ValueObject, ErrorObject>>{
      
      return Observable.create { observer in
        
        let request = Alamofire.request(request)
          .responseJSON { response in
            
            let statusCode = response.response?.statusCode ?? 0
            
            switch response.result {
            case .success:
              
              if let value = response.result.value,
                let obj = Mapper<ValueObject>().map(JSON: value as! [String : Any]) {
                observer.onNext(Result.successful(obj))
              } else if let value = response.result.value,
                var error = Mapper<ErrorObject>().map(JSON: value as! [String : Any]){
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              } else {
                var error = Mapper<ErrorObject>().map(JSON: [:] as! [String : Any])!
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              }
            case .failure:
              var error = Mapper<ErrorObject>().map(JSON: [:] as! [String : Any])!
              error.errorCode = statusCode
              observer.onNext(Result.failure(error))
            }
            
            observer.on(.completed)
        }
        
        return Disposables.create {
          request.cancel()
        }
      }
  }
  
  public func call<ValueObject:Mappable, ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<[ValueObject], ErrorObject>>{
      
      return Observable.create { observer in
        
        let request = Alamofire.request(request)
          .responseJSON { response in
            
            let statusCode = response.response?.statusCode ?? 0
            
            switch response.result {
            case .success:
              
              if let value = response.result.value,
                let obj = Mapper<ValueObject>().mapArray(JSONObject: value) {
                observer.onNext(Result.successful(obj))
              } else if let value = response.result.value,
                var error = Mapper<ErrorObject>().map(JSON: value as! [String : Any]){
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              } else {
                var error = Mapper<ErrorObject>().map(JSON: [:] as! [String : Any])!
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              }
              
            case .failure:
              var error = Mapper<ErrorObject>().map(JSON: [:] as! [String : Any])!
              error.errorCode = statusCode
              observer.onNext(Result.failure(error))
            }
            
            observer.on(.completed)
        }
        
        return Disposables.create {
          request.cancel()
        }
      }
  }
  
  public func call<ErrorObject:MappableError>(_ request:URLRequest)
    -> Observable<Result<Bool,ErrorObject>>{
      
      return Observable.create { observer in
        
        let request = Alamofire.request(request)
          .responseJSON { response in
      
            let statusCode = response.response?.statusCode ?? 0
            
            if let statusCode = response.response?.statusCode , (200 ... 399).contains(statusCode) {
              observer.onNext(Result.successful(true))
            } else if let value = response.result.value,
              var error = Mapper<ErrorObject>().map(JSON: value as! [String : Any]){
              error.errorCode = statusCode
              observer.onNext(Result.failure(error))
            } else {
              var error = Mapper<ErrorObject>().map(JSON: [:] as! [String : Any])!
              error.errorCode = statusCode
              observer.onNext(Result.failure(error))
            }
            
            observer.on(.completed)
        }
        
        return Disposables.create {
          request.cancel()
        }
      }
  }
}

