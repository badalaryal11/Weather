//
//  WeatherManager.swift
//  Mausam
//
//  Created by Badal  Aryal on 17/07/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=e146f48206672f3fade59bca2457e792&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        // 1. create a URL
        if let url = URL(string: urlString){ // here url string is a input to the URL method
            
            
            // 2.Create a url session
            let session = URLSession(configuration: .default)
            
            //3.Give a session a task
            let task = session.dataTask(with: url) {(data,response,error) in
                
                if error != nil{
                   
                    self.delegate?.didFailWithError(error: error!)
                    return // exit out of this function
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        
                       // let weatherVC = WeatherViewController()
                       // weatherVC.didUpdateWeather(weather: weather)
                        self.delegate?.didUpdateWeather(self, weather : weather)
                    }
                    
                    
                    
                }
                
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    func parseJSON (_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self,from: weatherData)
            print("City:",decodedData.name)
            print("Temperature:",decodedData.main.temp)
            print("Description:",decodedData.weather[0].description)
            print("Humidity:",decodedData.main.humidity)
            print("Weather Condition ID:" ,decodedData.weather[0].id)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp )
            print(weather.conditionName)
            print("Temperature:",weather.temperatureString)
            return weather
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
            
        }
        
        
        
        
    }
}
