//
//  WeatherData.swift
//  Clima
//
//  Created by Christian Eiselt on 15.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable
{
    let main: Main
    let name: String
    let weather: [Weather]
}

struct Main: Codable
{
    let temp: Double
}

struct Weather: Codable
{
    let id: Int
}
