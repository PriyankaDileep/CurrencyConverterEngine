//
//  String+Extension.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation

extension String {
  public func priceString(with currencyCode: String) -> String {
    guard let double = Double(self) else {
      return self
    }
    let currencyString = String(format: "%.2f", double)
    return currencyString
  }

  public func multiply(with doubleString: String) -> String {
    guard let firstDouble = Double(self),
          let secondDouble = Double(doubleString) else {
            return self
          }
    let finalDouble = firstDouble * secondDouble
    return String(format: "%.2f", finalDouble)
  }

  public func convertToCountryCode() -> String {
    let currencyCode = self
    guard currencyCode.count > 2 else {
      return currencyCode
    }
   return String(currencyCode.prefix(2))
  }

  public func removeFormatAmount() -> Double {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    formatter.currencySymbol = Locale.current.currencySymbol
    formatter.decimalSeparator = Locale.current.groupingSeparator
    return formatter.number(from: self)?.doubleValue ?? 0.00
  }

  public func currencyFormatting() -> String {
    if let value = Double(self) {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.maximumFractionDigits = 2
      formatter.minimumFractionDigits = 2
      if let str = formatter.string(for: value) {
        return str
      }
    }
    return ""
  }

  public func convertCurrencyToDoubleString() -> String {
    guard let double = Double(self) else {
      return String(format: "%.2f", self.removeFormatAmount())
    }
    return String(format: "%.2f", double)
  }
}
