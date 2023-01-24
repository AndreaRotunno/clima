//
//  WeatherManager.swift
//  Clima
//
//  Created by Andrea Rotunno on 23/01/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=62cccc9e1c564c4378959025ddc38203&units=metric"

func fetchWeather (cityName: String){
    let urlString = "\(weatherURL)&q=\(cityName)"
    performRequest(urlString)
}

func performRequest (_ urlString: String) {
    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                parseJSON(weatherData: safeData)
            }
        }
        task.resume()
    }
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather=WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
        } catch {
            print(error)
        }
    }
    
}



