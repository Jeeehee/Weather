//
//  WeatherList.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import Foundation

struct WeatherList: Decodable {
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
}

struct WeatherInfo: Decodable {
    let main, icon: String
}

struct Current: Decodable {
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let windSpeed: Double
    let weather: [WeatherInfo]
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity, weather
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
    }
}

struct Hourly: Decodable {
    let date: Int
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp
    }
}

struct Daily: Decodable {
    let date: Int
    let temp: Temp
    let weather: [WeatherInfo]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temp, weather
    }
}

struct Temp: Decodable {
    let min: Double
    let max: Double
}
