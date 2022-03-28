//
//  CurrencyPresenter.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

public struct CurrencyPresenter {
  public var currencyCode = ""
  public var countryCode = ""
  public var currencyName = ""
  public var country = ""
  public var buyingPrice = ""
  public var sellingPrice = ""
  public var lastUpdate = ""

  init(currency: Currency, enteredValue: String) {
    self.currencyCode = currency.currencyCode
    self.countryCode = currency.currencyCode.convertToCountryCode()
    self.currencyName = currency.currencyName
    self.country = currency.country
    self.lastUpdate = currency.lastUpdate
    self.buyingPrice = currency.buyingRate.multiply(with: enteredValue).priceString(with: currency.currencyCode)
    self.sellingPrice = currency.sellingRate.multiply(with: enteredValue).priceString(with: currency.currencyCode)
  }
}
