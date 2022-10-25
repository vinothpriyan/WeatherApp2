//
//  WeatherDataViewModel.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import Foundation
import Combine

public class WeatherDataViewModel: ObservableObject{
    
    @Published var responseweatherData: WeatherDataModel?
    @Published var failedRespons: String?
    private var weatherJSONData = FetchLiveWeatherData()
    private var cancelable = Set<AnyCancellable>()
    
    public func fetchedRecords(searchLocation: String = "Chennai"){
        
        weatherJSONData.fetchWeatherData(key: "522db6a157a748e2996212343221502", location: searchLocation, numberof: 7, weatherData: WeatherDataModel.self)
            .sink(receiveCompletion: { error in
                switch error{
                case .finished:
                    print("Request finished")
                case .failure(let errorIs):
                    self.failedRespons = errorIs.localizedDescription
                    print("Request failed with error \(errorIs.localizedDescription)")
                }
                
            }, receiveValue: { [weak self] responsedWeatherData in
                DispatchQueue.main.async {
                    self?.responseweatherData = responsedWeatherData
                    print(responsedWeatherData.forecast.forecastday.count)
                }
            })
            .store(in: &cancelable)
    }
}

public let dateFormatted: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()
