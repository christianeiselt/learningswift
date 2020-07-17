//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
}

struct CoinManager {

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let secrets = Secrets()

    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String)
    {
        let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
        let apiKey = secrets.getToken(for: "coinAPI")
        let currencyURL = "\(baseURL)/\(currency)?apikey=\(apiKey)"

        performRequest(with: currencyURL)
    }

    func performRequest(with urlString: String)
    {
        // 1. Create a URL
        if let url = URL(string: urlString)
        {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)

            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil
                {
                    delegate?.didFailWithError(error: error!)
                    return
                }

                if let safeData = data
                {
                    if let coin = parseJSON(coinData: safeData)
                    {
                        delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }

            // 4. Start the task
            task.resume()
        }
    }

    func parseJSON(coinData: Data) -> CoinModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let assetIdBase = decodedData.asset_id_base
            let assetIdQuote = decodedData.asset_id_quote
            let rate = decodedData.rate

            let coin = CoinModel(cryptoCurrency: assetIdBase, fiatCurrency: assetIdQuote, exchangeRate: rate)
            return coin
        }
        catch
        {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
