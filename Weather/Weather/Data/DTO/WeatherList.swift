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

struct WeatherDTO: Decodable {
    struct WeatherList: Decodable {
        let current: [Current]
        let hourly: [Hourly]
        let daily: [Daily]
    }

    struct WeatherInfo: Decodable {
        let main: String
        let icon: String
    }

    struct Current: Decodable {
        let temp: Double
        let feelsLike: Double
        let pressure: Int
        let humidity: Int
        let windSpeed: Double
        let weather: [WeatherInfo]
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity, weather
            case feelsLike = "feels_like"
            case windSpeed = "wind_spee"
        }
    }

    struct Hourly: Decodable {
        let date: String
        let temp: Double
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case temp
        }
    }

    struct Daily: Decodable {
        let date: String
        let temp: [Temp]
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
}

extension WeatherDTO.WeatherInfo {
    func toDomain() -> WeatherInfo {
        return .init(
            main: main,
            icon: icon)
    }
}

extension WeatherDTO.Current {
    func toDomain() -> CurrentWeather {
        return .init(
            temp: Double.fahrenheitTocelsius(fahrenheit: temp),
            feelsLike: Double.fahrenheitTocelsius(fahrenheit: feelsLike),
            pressure: pressure,
            humidity: humidity,
            windSpeed: windSpeed,
            weather: weather.map { $0.toDomain() })
    }
}

extension WeatherDTO.Hourly {
    func toDomain() -> HourlyWeather {
        return .init(
            date: dateFormatter.date(from: date),
            temp: Double.fahrenheitTocelsius(fahrenheit: temp))
    }
}

extension WeatherDTO.Daily {
    func toDomain() -> DailyWeather {
        return .init(
            date: dateFormatter.date(from: date),
            min: temp.map { Double.fahrenheitTocelsius(fahrenheit: $0.min) },
            max: temp.map { Double.fahrenheitTocelsius(fahrenheit: $0.max) },
            weather: weather.map { $0.toDomain() })
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()
