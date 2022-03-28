//
//  Products.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import Foundation
public struct Products: Codable {
  public var currencies = [CurrencyRates]()

  public struct GenericCodingKeys: CodingKey {
    public var stringValue: String
    public init?(stringValue: String) {
      self.stringValue = stringValue
    }
    public var intValue: Int?
    public init?(intValue: Int) {
      return nil
    }
  }
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: GenericCodingKeys.self)
    for key in container.allKeys {
      let value = try container.decode(CurrencyRates.self, forKey: GenericCodingKeys(stringValue: key.stringValue)!)
      self.currencies.append(value)
    }
  }
}
