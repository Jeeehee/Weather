//
//  domain.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import Foundation

struct CurrentWeather {
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let windSpeed: Double
    let weather: [WeatherInfo]
}

struct HourlyWeather {
    let date: Date?
    let temp: Double
}

struct DailyWeather {
    let date: Date?
    let min: [Double]
    let max: [Double]
    let weather: [WeatherInfo]
}
