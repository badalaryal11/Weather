//
//  WeatherModel.swift
//  Mausam
//
//  Created by Badal  Aryal on 17/07/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String (format: "%.1f", temperature)
    }
    var conditionName: String{
        switch conditionId {
        case 200...232:
            return "Weather Condition: cloud.bolt"
        case 300...321:
            return "Weather Condition: cloud.drizzle"
        case 500...531:
            return "Weather Condition: cloud.rain"
        case 600...622:
            return "Weather Condition: cloud.snow"
        case 701...781:
            return "Weather Condition: cloud.fog"
        case 800:
            return "Weather Condition: sun.max"
        case 801...804:
            return "Weather Condition: cloud.bolt"
        default:
            return "Weather Condition: cloud"
        }
        
    }
    
    
    
}

