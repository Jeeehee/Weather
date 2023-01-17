//
//  Weather.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation

struct Weather: Decodable {
    let coord: Coord
    let weather: [WeatherInfo]
    let main: Main
    let wind: Wind
    let clouds: Clouds
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
}

// MARK: - Weather
struct WeatherInfo: Decodable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}
