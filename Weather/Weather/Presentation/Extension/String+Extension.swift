//
//  String+Extension.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import Foundation

extension String {
    static func getHour(date: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH시"
        return dateFormatter.string(from: date)
    }
    
    static func getDay(date: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }
    
    static func fahrenheitTocelsius(fahrenheit: Double) -> String {
        let celsius = UnitTemperature.celsius
        let result = celsius.converter.value(fromBaseUnitValue: fahrenheit)
        return String(format: "%.0f", result)
    }
}
