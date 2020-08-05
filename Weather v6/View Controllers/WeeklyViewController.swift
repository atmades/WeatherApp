//
//  WeeklyViewController.swift
//  Weather v6
//
//  Created by Максим on 23.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class WeeklyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let idCell = "dayCell"
    private var weathers: [(String,String)] = []
    private let networkManager = NetworkManager()
    
    var forCity = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        self.title = forCity.replacingOccurrences(of: "%20", with: " ")
    }
}

// MARK: - DataSource

extension WeeklyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! DayTableViewCell
        
        networkManager.fetchDataWeekly(by: forCity) { weatherData in
            guard let weeklyWeather = WeeklyWeather(weeklyWeather: weatherData) else {return}
            let day = weeklyWeather.weathers[indexPath.row]
            
            let weekDay = self.fromDateToWeekDay(for: day.0)
            
            cell.date.text = day.0
            cell.temperatura.text = day.1 + " " + celcia
            cell.dayOfWeek.text = weekDay

        }
        return cell
    }
}
