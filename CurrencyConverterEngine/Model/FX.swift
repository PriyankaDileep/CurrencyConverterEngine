//
//  FX.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

public struct FX: Codable {
  public var portfolioId = ""
  public var products: Products
  public enum CodingKeys: String, CodingKey {
    case portfolioId = "PortfolioId",
         products = "Products"
  }
}
