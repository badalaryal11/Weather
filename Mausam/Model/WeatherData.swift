//
//  WeatherData.swift
//  Mausam
//
//  Created by Badal  Aryal on 17/07/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Codable{ // codable is a typealias of (Decodable and Encodable) Protocol
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
    let humidity: Double
    
}

struct Weather: Codable{
    let description: String
    let id: Int
}







