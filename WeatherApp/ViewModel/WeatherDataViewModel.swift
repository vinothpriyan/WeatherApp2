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
    private var weatherJSONData = FetchLiveWeatherData()
    private var cancelable: AnyCancellable?
    
    
    public func fetchedRecords(searchLocation: String = "Chennai"){
        
        self.cancelable = weatherJSONData.fetchWeatherData(location: searchLocation)
            .sink(receiveCompletion: { error in
                switch error{
                    
                case .finished:
                    print("Request finished")
                case .failure(let errorIs):
                    print("Request failed with error \(errorIs.localizedDescription)")
                }
                
            }, receiveValue: { [weak self] responsedWeatherData in
                DispatchQueue.main.async {
                    self?.responseweatherData = responsedWeatherData
                    if #available(iOS 15.0, *) {
                        print(" The record is \(responsedWeatherData.location.region)")
                    } else {
                        // Fallback on earlier versions
                    }
                }
            })
    }
}

public let dateFormatted: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()
