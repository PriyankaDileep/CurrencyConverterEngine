//
//  CurrencyConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Priyanka on 27/3/22.
//

import UIKit
import Combine

open class CurrencyConverterViewModel {
  public init() {
    setUpCurrencyConverter()
  }
  /// A shared JSON decoder to use in calls.
  private let decoder = JSONDecoder()

  public var currencyModels = CurrentValueSubject<[CurrencyPresenter], Never>([CurrencyPresenter]())
  public var enteredText = CurrentValueSubject<String, Never>("1.00")

  var subsciptions = Set<AnyCancellable>()

  public func setUpCurrencyConverter() {
    enteredText
      .removeDuplicates()
      .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
      .map { [unowned self] (searchText) -> AnyPublisher<[CurrencyPresenter], Never> in

        self.getCurrencyPresenters(enteredValue: searchText)
          .catch { (_) in
            Just([CurrencyPresenter]())
          }
          .eraseToAnyPublisher()
      }
      .switchToLatest()
      .sink { [unowned self] (currencyPresenters) in
        self.currencyModels.send(currencyPresenters)
      }.store(in: &subsciptions)

  }

  public func getCurrencyPresenters(enteredValue: String = "1.00") -> AnyPublisher<[CurrencyPresenter], Error> {
    CurrencyConverterServices()
      .publisher()
      .tryMap { data in
        try JSONDecoder().decode(CurrencyDetails.self, from: data)
      }
      .map({ $0.data.brands.wbc.portfolios.fx.products.currencies
      .compactMap { $0.Rates.values.first}
      .sorted { $0.country.lowercased() < $1.country.lowercased() }
      .map { CurrencyPresenter(currency: $0, enteredValue: enteredValue)}
      })
      .eraseToAnyPublisher()
  }

}
