//
//  Configurable.swift
//  RxRetroSwift
//
//  Created by Michael Henry Pantaleon on 2018/01/04.
//

public protocol Configurable {}

public extension Configurable {
  @discardableResult public func configure( block: ((inout Self)) -> Void) -> Self {
    var m = self
    block(&m)
    return m
  }
}
