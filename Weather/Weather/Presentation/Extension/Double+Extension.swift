//
//  Double+Extension.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import Foundation

extension Double {
    static func fahrenheitTocelsius(fahrenheit: Double) -> Double {
        let celsius = UnitTemperature.celsius
        let result = celsius.converter.value(fromBaseUnitValue: fahrenheit)
        return result.rounded()
    }
}
