//
//  WBC.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//


import Foundation

public struct WBC: Codable {
  public var portfolios: Portfolios
  public enum CodingKeys: String, CodingKey {
    case portfolios = "Portfolios"
  }
}
