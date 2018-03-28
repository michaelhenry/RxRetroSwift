//
//  RequestCaller.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//

import Foundation
import RxSwift
import RxCocoa

public typealias CodableError = Decodable & HasErrorCode

public class RequestCaller{
  
  lazy var decoder = JSONDecoder()
  
  private var config:URLSessionConfiguration
  
  private lazy var urlSession:URLSession = {
    let session = URLSession(configuration: config)
    return session
  }()
  
  public init(config:URLSessionConfiguration) {
    self.config = config
  }
  
  public func call<ItemModel:Codable, CodableErrorModel:CodableError>(_ request: URLRequest)
    -> Observable<Result<ItemModel, CodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
              if let value = data,
                let objs = try? _self.decoder.decode(ItemModel.self, from: value) {
                observer.onNext(Result.successful(objs))
              } else if let value = data,
                var error = try? _self.decoder.decode(CodableErrorModel.self, from: value) {
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              } else {
                var error = CodableErrorModel()
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              }
            }
            observer.on(.completed)
        }
        task.resume()
        return Disposables.create {
          task.cancel()
        }
      }
  }
  
  
  public func call<CodableErrorModel:CodableError>(_ request: URLRequest)
    -> Observable<Result<RawResponse, CodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
              if (200...399).contains(statusCode) {
                let plainResponse = RawResponse(statusCode: statusCode, data: data)
                observer.onNext(Result.successful(plainResponse))
              } else if let value = data,
                var error = try? _self.decoder.decode(CodableErrorModel.self, from: value) {
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              } else {
                var error = CodableErrorModel()
                error.errorCode = statusCode
                observer.onNext(Result.failure(error))
              }
            }
            observer.on(.completed)
        }
        task.resume()
        return Disposables.create {
          task.cancel()
        }
      }
  }
}

