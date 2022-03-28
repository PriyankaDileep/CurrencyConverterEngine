//
//  Portfolios.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

public struct Portfolios: Codable {
  public var fx: FX
  public enum CodingKeys: String, CodingKey {
    case fx = "FX"
  }
}
