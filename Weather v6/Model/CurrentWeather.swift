//
//  CurrentWeather.swift
//  Weather v6
//
//  Created by Максим on 21.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation


struct CurrentWeather {
    
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        guard let cityName = currentWeatherData.data.first?.cityName else {return nil}
        self.cityName = cityName
        guard let temperature = currentWeatherData.data.first?.temp else {return nil}
        self.temperature = temperature
    }
}
