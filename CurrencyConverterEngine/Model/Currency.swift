//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

public struct Currency: Codable {
  public var currencyCode = ""
  public var currencyName = ""
  public var country = ""
  public var buyingRate = ""
  public var sellingRate = ""
  public var lastUpdate = ""

  public enum CodingKeys: String, CodingKey {
    case currencyCode = "currencyCode",
         currencyName = "currencyName",
         country = "country",
         buyingRate = "buyTT",
         sellingRate = "sellTT",
         lastUpdate = "LASTUPDATED"
  }
}
