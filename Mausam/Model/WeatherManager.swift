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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // 1. create a URL
        if let url = URL(string: urlString){ // here url string is a input to the URL method
            
            
            // 2.Create a url session
            let session = URLSession(configuration: .default)
            
            //3.Give a session a task
            let task = session.dataTask(with: url) {(data,response,error) in
                if (error != nil){
                    print(error!)
                    return // exit out of this function
                }
                if let safeData = data{
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                }
                
            }
            
            // 4. Start the task
            task.resume()
        }
    }
}


