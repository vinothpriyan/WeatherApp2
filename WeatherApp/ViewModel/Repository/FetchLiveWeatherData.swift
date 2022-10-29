//
//  FetchLiveWeatherData.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import Foundation
import Combine

public class FetchLiveWeatherData{
    
    private var cancelable = Set<AnyCancellable>()
    
    func fetchWeatherData<CustomType: Decodable>(key: String, location: String, numberof days: Int, weatherData: CustomType.Type)->Future<CustomType, Error>{
        
        let queryItems = [URLQueryItem(name: "key", value: key), URLQueryItem(name: "q", value: location), URLQueryItem(name: "days", value: "\(days)"), URLQueryItem(name: "aqi", value: "yes"), URLQueryItem(name: "alerts", value: "no")]
        var urlComp = URLComponents(string: "https://api.weatherapi.com/v1/forecast.json/data/")
        urlComp?.queryItems = queryItems
        let baseURL = urlComp?.url
        
        return Future<CustomType, Error> { [weak self] futureData in
             guard let requestURL = baseURL
             else { return futureData(.failure(NetworkError.invalidURL)) }
             
        URLSession.shared.dataTaskPublisher(for: requestURL)
              .tryMap{(data, response)-> Data in
                  guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                      throw NetworkError.networkError
                  }
                  return data
              }
              .decode(type: CustomType.self, decoder: JSONDecoder())
              .receive(on: DispatchQueue.main)
              .sink { completion in
                  switch completion{
                  case .finished:
                      print("Request Finished Successfully")
                  case .failure(let error):
                      print("Request falied with error \(error.localizedDescription)")
                  }
              } receiveValue: { futureData(.success($0))}
             .store(in: &self!.cancelable)
        }
    }

}
