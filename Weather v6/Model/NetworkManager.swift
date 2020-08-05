//
//  NetworkManager.swift
//  Weather v6
//
//  Created by Максим on 21.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//


import UIKit


class NetworkManager {
    
    //     MARK: - For cityName
            
    func fetchCityData(by city: String, completion: @escaping (CurrentWeatherData) -> ()) {
        let urlString = "https://api.weatherbit.io/v2.0/current?city=\(city)&key=\(apiKey)"

        guard let url = URL(string: urlString) else {return}
        
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let _ = response else { return }

            do { let weather = try decoder.decode(CurrentWeatherData.self, from: data)
                DispatchQueue.main.async {
                    print("Temperature in \(weather.data.first?.cityName ?? "Unknow") is \(String(describing: weather.data.first?.temp ?? 0.0)) °C")
                    completion(weather)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
//    MARK: - Weekly
       func fetchDataWeekly(by city: String, completion: @escaping (WeeklyWeatherData) -> ()) {
               let urlCity = "https://api.weatherbit.io/v2.0/forecast/daily?city=\(city)&key=\(apiKey)"
    
               guard let url = URL(string: urlCity) else {return}
               
               let decoder = JSONDecoder()
               URLSession.shared.dataTask(with: url) { data, response, error in
                   guard let data = data, let _ = response else { return }
                   
                   do { let weeklyWeather = try decoder.decode(WeeklyWeatherData.self, from: data)
       //                print(weather.name)
                       DispatchQueue.main.async {
                           completion(weeklyWeather)
                       }
                   } catch {
                       print(error)
               }
                   
               }.resume()
           }
}


