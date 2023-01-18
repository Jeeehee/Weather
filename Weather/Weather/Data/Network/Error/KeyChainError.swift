//
//  KeyChainError.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation

enum KeyChainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unknown(OSStatus)
    case error(Error)
}
