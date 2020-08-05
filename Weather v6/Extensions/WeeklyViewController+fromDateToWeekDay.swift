//
//  WeeklyViewController+fromDateToWeekDay.swift
//  Weather v6
//
//  Created by Максим on 31.07.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

extension WeeklyViewController {
    
    func fromDateToWeekDay(for dateString: String) -> String {
        
//      Create array with date elements
        let dateStrings = dateString.components(separatedBy: "-")
        
//      Convert String array to Int array
        var dateInts: [Int] = []
        for item in dateStrings {
            guard let number = Int(item) else { return "Date incorrect"}
            dateInts.append(number)
        }
        
//      Working with date
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        var dataComponents = DateComponents()
        dataComponents.year = dateInts[0]
        dataComponents.month = dateInts[1]
        dataComponents.year = dateInts[2]

        guard let forDate = calendar.date(from: dataComponents) else { return "Date incorrect" }
        let weekDay = dateFormatter.string(from: forDate)

        return weekDay
    }
}
