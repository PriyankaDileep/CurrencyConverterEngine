//
//  CurrencyData.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

public struct CurrencyData: Codable {
  public var brands: Brands

  public enum CodingKeys: String, CodingKey {
    case brands = "Brands"
  }
}
