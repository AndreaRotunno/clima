//
//  WeatherModel.swift
//  Clima
//
//  Created by Andrea Rotunno on 24/01/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    let temperatureStr: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionID{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
