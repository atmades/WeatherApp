//
//  CurrentWeatherData.swift
//  Weather v6
//
//  Created by Максим on 21.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
    let data: [DatumCurrent]
    let count: Int
    
}

// MARK: - Data
struct DatumCurrent: Codable {
    let cityName: String?
    let temp: Double?
    
//    let rh: Double
//    let pod: String
//    let lon, pres: Double
//    let timezone, obTime, countryCode: String
//    let clouds, ts: Int
//    let solarRAD: Double
//    let stateCode: String
//    let windSpd: Double
//    let windCdirFull, windCdir: String
//    let slp: Double
//    let vis: Int
//    let hAngle: Double
//    let sunset: String
//    let dni: Double
//    let dewpt: Double
//    let snow, precip, windDir: Int
//    let uv: Double
//    let sunrise: String
//    let aqi: Int
//    let ghi: Double
//    let dhi: Double
//    let lat: Double
//    let weather: Weather?
//    let datetime: String
//   
//    let station: String
//    let elevAngle, appTemp: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case cityName = "city_name"
    
//        case rh, pod, lon, pres, timezone
//        case obTime = "ob_time"
//        case countryCode = "country_code"
//        case clouds, ts
//        case solarRAD = "solar_rad"
//        case stateCode = "state_code"
//        case cityName = "city_name"
//        case windSpd = "wind_spd"
//        case windCdirFull = "wind_cdir_full"
//        case windCdir = "wind_cdir"
//        case slp, vis
//        case hAngle = "h_angle"
//        case sunset, dni, dewpt, snow, uv, precip
//        case windDir = "wind_dir"
//        case sunrise, ghi, dhi, aqi, lat, weather, datetime, temp, station
//        case elevAngle = "elev_angle"
//        case appTemp = "app_temp"
    }
}

// MARK: - Weather
//struct Weather: Codable {
//    let icon, description: String
//    let code: String
//
//    enum CodingKeys: String, CodingKey {
//        case icon, code
//        case description = "description"
//    }
//}

