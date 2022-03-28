//
//  CurrencyConverterService.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//


import Foundation
import Combine

public protocol CurrencyConverterServicesApi {
  func publisher() -> AnyPublisher< Data, Error>
}
public struct CurrencyConverterServices {
  public var url = URL(string: "https://www.westpac.com.au/bin/getJsonRates.wbc.fx.json#")!
}

extension CurrencyConverterServices: CurrencyConverterServicesApi {
  public func publisher() -> AnyPublisher< Data, Error> {
    URLSession.shared
      .dataTaskPublisher(for: url)
      .tryMap(\.data)
      .eraseToAnyPublisher()
  }
}
