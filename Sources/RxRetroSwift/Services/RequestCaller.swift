//
//  RequestCaller.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//

import Foundation
import RxSwift
import RxCocoa

public typealias DecodableError = Decodable & HasErrorInfo

public class RequestCaller{
  
  private lazy var decoder = JSONDecoder()
  private var urlSession:URLSession
  
  public init(config:URLSessionConfiguration) {
    urlSession = URLSession(configuration: config)
  }
  
  public convenience init() {
    self.init(config: URLSessionConfiguration.default)
  }
  
  public func call<ItemModel:Decodable, DecodableErrorModel:DecodableError>(_ request: URLRequest)
    -> Observable<Result<ItemModel, DecodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
              
              do {
                let _data = data ?? Data()
                if (200...399).contains(statusCode) {
                  let objs = try _self.decoder.decode(ItemModel.self, from: _data)
                  observer.onNext(Result.successful(objs))
                } else {
                  var error = try _self.decoder.decode(DecodableErrorModel.self, from: _data)
                  error.errorCode = statusCode
                  observer.onNext(Result.failure(error))
                }
              } catch {
                var decodingError = DecodableErrorModel()
                decodingError.errorCode = -1
                decodingError.errorDetail = error.localizedDescription
                observer.onNext(Result.failure(decodingError))
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
  
  public func call<DecodableErrorModel:DecodableError>(_ request: URLRequest)
    -> Observable<Result<RawResponse, DecodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            let _data = data ?? Data()
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
              
              do {
                if (200...399).contains(statusCode) {
                  let plainResponse = RawResponse(statusCode: statusCode, data: _data)
                  observer.onNext(Result.successful(plainResponse))
                } else {
                  var error = try _self.decoder.decode(DecodableErrorModel.self, from: _data)
                  error.errorCode = statusCode
                  observer.onNext(Result.failure(error))
                }
                
              } catch {
                var decodingError = DecodableErrorModel()
                decodingError.errorCode = -1
                decodingError.errorDetail = error.localizedDescription
                observer.onNext(Result.failure(decodingError))
              }
              observer.on(.completed)
            }
        }
        task.resume()
        return Disposables.create {
          task.cancel()
        }
      }
  }
}

