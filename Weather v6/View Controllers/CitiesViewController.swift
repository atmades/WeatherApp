//
//  ViewController.swift
//  Weather v6
//
//  Created by Максим on 21.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//


import UIKit

class CitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let idCell = "cityCell"
    private let networkManager = NetworkManager()
    private var cities = ["Berlin", "Moscow", "Madrid", "London"]
    var choosedCity = ""
    
    @IBAction func addCity(_ sender: UIBarButtonItem) {
//        self.setCityNameAlert(title: "Please", message: "Enter city name")
        self.setCityNameAlert()
        
    }
    
    func setCityNameAlert() {
        //  Create alert
        let alertController = UIAlertController(title: "Enter city name",
                                                message: nil,
                                                preferredStyle: .alert)
        
        //  Create Message
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 270, height:18))
        label.textAlignment = .center
        label.textColor = .red
        label.font = label.font.withSize(12)
        alertController.view.addSubview(label)
        label.isHidden = true
        
        //  Button Add
        let saveAction = UIAlertAction(title: "Add", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newCity = tf?.text {
      
                //  Check Empty TextField
                if newCity == "" {
                    label.text = "Please enter city"
                    label.isHidden = false
                    self.present(alertController, animated: true, completion: nil)
                    
                //  Check Duplicate
                } else if self.cities.contains(newCity) {
                    label.text = "\(newCity) is already on the list"
                    label.isHidden = false
                    self.present(alertController, animated: true, completion: nil)
                    
                //  Check JSON
                } else {
  
                    let city = newCity.split(separator: " ").joined(separator: "%20")
                    
                    self.networkManager.fetchCityData(by: city) { weatherData in
                        if CurrentWeather(currentWeatherData: weatherData) != nil {
                            print("City name is correct")
                            self.cities.insert(city, at: 0)
                            self.tableView.reloadData()
                            print(self.cities)
                        } else {
                            print("Unknow city")
                            label.text = "Please enter correct city name"
                            label.isHidden = false
                            self.present(alertController, animated: true, completion: nil)
                        }
                }
            }
        }
    }
     
        // Assemble alert
        alertController.addTextField { _ in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//  MARK: - Data Source

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CityTableViewCell
        
        let city = cities[indexPath.row]
        
        networkManager.fetchCityData(by: city) { weatherData in
            let currentWeather = CurrentWeather(currentWeatherData: weatherData)
            cell.nameOfCity.text = currentWeather?.cityName ?? "Unknow"
            cell.currentTemp.text = "\(currentWeather?.temperatureString ?? "Unknow") \(celcia)"
        }
        return cell
    }
}

//  MARK: - Delegate and Navigation

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let city = cities[indexPath.row]
        self.choosedCity = city
        
        performSegue(withIdentifier: "Weekly", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//  MARK: - Navigation
extension CitiesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let weeklyVC = segue.destination as! WeeklyViewController
        weeklyVC.forCity = choosedCity
    }
}
