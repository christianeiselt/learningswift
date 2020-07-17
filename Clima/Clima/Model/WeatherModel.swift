//
//  WeatherModel.swift
//  Clima
//
//  Created by Christian Eiselt on 15.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel
{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String
    {
        return String(format: "%.1f", temperature)
    }

    var conditionName: String
    {
        switch conditionId
        {
            case 200...232:
                return "cloud.bolt" // Thunderstorm
            case 300...321:
                return "cloud.drizzle" // Drizzle
            case 500...531:
                return "cloud.rain" // Rain
            case 600...622:
                return "cloud.snow" // Snow
            case 700...781:
                return "cloud.fog" // Atmosphere
            case 800...800:
                return "sun.max" // Clear ("moon.stars")
            case 801...804:
                return "cloud" // Clouds
            default:
                return "cloud"
        }
    }
}
