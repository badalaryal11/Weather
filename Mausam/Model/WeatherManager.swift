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
                    self.parseJSON(weatherData: safeData)
                    
                }
                
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    func parseJSON (weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self,from: weatherData)
            print("City: ",decodedData.name)
            print("Temperature: ",decodedData.main.temp)
            print("Description: ",decodedData.weather[0].description)
            print("Humidity: ",decodedData.main.humidity)
        } catch{
            print(error)
        }
    }
    
    
}
