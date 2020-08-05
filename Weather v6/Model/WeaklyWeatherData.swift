//
//  WeaklyWeatherData.swift
//  Weather v6
//
//  Created by Максим on 23.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

// MARK: - Currency
struct WeeklyWeatherData: Codable {
    let data: [ListData]
    let cityName, lon, timezone, lat: String
    let countryCode, stateCode: String

    enum CodingKeys: String, CodingKey {
        case data
        case cityName = "city_name"
        case lon, timezone, lat
        case countryCode = "country_code"
        case stateCode = "state_code"
    }
}

// MARK: - Datum
struct ListData: Codable, Identifiable {
    let id = UUID()
    let datetime: String?
    let temp: Double
    let minTemp: Double?
    let ts: Int
    let weather: WeatherWeekly
    let forDate: String
    
//    let cloudsMid, cloudsLow: Int?

    enum CodingKeys: String, CodingKey {
        case datetime, temp, ts, weather
        case minTemp = "min_temp"
        case forDate = "valid_date"

    }
}

// MARK: - Weather
struct WeatherWeekly: Codable {
    let icon: String
    let code: Int
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case icon, code
        case weatherDescription = "description"
    }
}
