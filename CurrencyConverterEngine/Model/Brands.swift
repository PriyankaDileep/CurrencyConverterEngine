//
//  Brands.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//


import Foundation
public struct Brands: Codable {
  public var wbc: WBC
  public enum CodingKeys: String, CodingKey {
    case wbc = "WBC"
  }

}
