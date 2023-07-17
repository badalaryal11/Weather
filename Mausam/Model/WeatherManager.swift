//
//  WeatherManager.swift
//  Mausam
//
//  Created by Badal  Aryal on 17/07/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=e146f48206672f3fade59bca2457e792&units=metric"
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
}
