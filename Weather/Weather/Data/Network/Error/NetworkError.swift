//
//  NetworkError.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation

enum NetworkError: Error {
    case invalidStatusCode(statusCode: Int)
    case invalidURL
    case dataEmpty
    case reponseFailed
    case requestFailed
    case decodeFailed
    case encoding
    case error(Error)
}
