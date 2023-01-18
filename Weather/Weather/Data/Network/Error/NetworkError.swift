//
//  NetworkError.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation

enum NetworkError: Error {
    case dataEmpty
    case requestFailed
    case decodeFailed
    case error(Error)
}
