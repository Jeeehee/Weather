//
//  EndPoint.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import Alamofire

enum EndPoint {
    case weather(city: String, appKey: String)
}

extension EndPoint: Requestable {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case .weather: return "/data/2.5/weather"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .weather(let city, let apiKey):
            return [
                URLQueryItem(name: "q", value: "\(city)"),
                URLQueryItem(name: "appid", value: "\(apiKey)")]
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        return .get
    }
    
    var url: URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        urlComponent.queryItems = queryItems
        return urlComponent.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        return request
    }
}
