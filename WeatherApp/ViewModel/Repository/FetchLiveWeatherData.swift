//
//  FetchLiveWeatherData.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import Foundation
import Combine

public class FetchLiveWeatherData{
    
     func fetchWeatherData(key: String = "522db6a157a748e2996212343221502", location: String, numberof days: Int)->AnyPublisher<WeatherDataModel, Error>{
        
         return URLSession.shared.dataTaskPublisher(for:
                                                     URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(key)&q=\(location)&days=\(days)&aqi=no&alerts=no")!)
         .map{$0.data}
         .decode(type: WeatherDataModel.self, decoder: JSONDecoder())
         .receive(on: DispatchQueue.main)
         .eraseToAnyPublisher()
    }
}
