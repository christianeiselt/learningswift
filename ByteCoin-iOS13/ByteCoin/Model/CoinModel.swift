//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Christian Eiselt on 17.07.20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel
{
    let cryptoCurrency: String
    let fiatCurrency: String
    let exchangeRate: Double

    var exchangeRateString: String
    {
        return String(format: "%.2f", exchangeRate)
    }
}
