//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import Foundation


struct WeatherDataModel: Hashable, Decodable, Equatable{
    var location: Location
    var current: CurrentData
}

struct Location: Decodable, Hashable, Equatable{
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Date
    let localtime: String
}

struct CurrentData: Decodable, Hashable, Equatable{
    let last_updated_epoch: Date
    let last_updated: String
    let temp_c: Float
    let temp_f: Float
    let is_day: Int
    let wind_mph: Float
    let wind_kph: Float
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Float
    let condition: Conditions
    let precip_in: Float
    let humidity: Int
    let cloud: Int
    let feelslike_c: Float
    let feelslike_f: Float
    let vis_km: Float
    let vis_miles: Float
    let uv: Float
    let gust_mph: Float
    let gust_kph: Float
}

struct Conditions: Decodable, Hashable, Equatable{
    let text: String
    let icon: String
    let code: Int
}
