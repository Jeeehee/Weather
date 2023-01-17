//
//  Requestable.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import Alamofire

protocol Requestable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: Alamofire.HTTPMethod { get }
    var url: URL? { get }
    var urlRequest: URLRequest? { get }
}
