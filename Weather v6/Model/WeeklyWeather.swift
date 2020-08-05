//
//  WeeklyWeather.swift
//  Weather v6
//
//  Created by Максим on 23.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

struct WeeklyWeather {
    
    var weathers: [(String,String)] = []
    
    init?(weeklyWeather: WeeklyWeatherData) {
        
//        guard !weeklyWeather.data.isEmpty else { return nil }
        
        let weathersData = weeklyWeather.data
        for (index, _)  in weathersData.enumerated() {
            let forDate = weeklyWeather.data[index].forDate
            
            let temperature = weeklyWeather.data[index].temp
            let temperatureString = String(format: "%.0f", temperature)

            self.weathers.append((forDate, temperatureString))
        }
    }
}

