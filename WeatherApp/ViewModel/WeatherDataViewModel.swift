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
    @Published var faledRespons: String?
    private var weatherJSONData = FetchLiveWeatherData()
    private var cancelable: AnyCancellable?
    
    
    public func fetchedRecords(searchLocation: String = "Chennai"){
        
        self.cancelable = weatherJSONData.fetchWeatherData(location: searchLocation, numberof: 7)
            .sink(receiveCompletion: { error in
                switch error{
                    
                case .finished:
                    print("Request finished")
                case .failure(let errorIs):
                    self.faledRespons = errorIs.localizedDescription
                    print("Request failed with error \(errorIs.localizedDescription)")
                }
                
            }, receiveValue: { [weak self] responsedWeatherData in
                DispatchQueue.main.async {
                    self?.responseweatherData = responsedWeatherData
                    print(responsedWeatherData.forecast.forecastday.count)
                }
            })
    }
}

public let dateFormatted: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()
