//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 18/10/22.
//

import Foundation


struct WeatherDataModel: Hashable, Codable, Equatable{
    let location: Location
    let current: CurrentData
    let forecast: Forcast
}

struct Location: Codable, Hashable, Equatable{
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Date
    let localtime: String
}

struct CurrentData: Codable, Hashable, Equatable{
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

struct Forcast: Codable, Hashable, Equatable{
    let forecastday: [ForcastDay]
}

struct ForcastDay: Codable, Hashable, Equatable{
    let date: String
    let date_epoch: Date
    let day: ForcastSingleDay
    let astro: Astro
    let hour: [HourlyData]
}

struct ForcastSingleDay: Codable, Equatable, Hashable{
    let maxtemp_c: Float
    let maxtemp_f: Float
    let mintemp_c: Float
    let mintemp_f: Float
    let avgtemp_c: Float
    let avgtemp_f: Float
    let maxwind_mph: Float
    let maxwind_kph: Float
    let totalprecip_mm: Float
    let totalprecip_in: Float
    let avgvis_km: Float
    let avgvis_miles: Float
    let avghumidity: Float
    let daily_will_it_rain: Int
    let daily_chance_of_rain: Int
    let daily_will_it_snow: Int
    let daily_chance_of_snow: Int
    let condition: Conditions
    let uv: Float
}

struct Astro: Codable, Hashable, Equatable{
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let moon_illumination: String
}

struct HourlyData: Codable, Hashable, Equatable{
    let time_epoch: Date
    let time: String
    let temp_c: Float
    let temp_f: Float
    let is_day: Int
    let condition: Conditions
    let wind_mph: Float
    let wind_kph: Float
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Float
    let pressure_in: Float
    let precip_mm: Float
    let precip_in: Float
    let humidity: Int
    let cloud: Int
    let feelslike_c: Float
    let feelslike_f: Float
    let windchill_c: Float
    let windchill_f: Float
    let heatindex_c: Float
    let heatindex_f: Float
    let dewpoint_c: Float
    let dewpoint_f: Float
    let will_it_rain: Int
    let chance_of_rain: Int
    let will_it_snow: Int
    let chance_of_snow: Int
    let vis_km: Float
    let vis_miles: Float
    let gust_mph: Float
    let gust_kph: Float
    let uv: Float
}

struct Conditions: Codable, Hashable, Equatable{
    let text: String
    let icon: String
    let code: Int
}
