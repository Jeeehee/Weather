//
//  UserDefaults+Extension.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation

extension UserDefaults {
    static func isFirstLoding() -> Bool {
        let isFirstLodingFlag = "isFirstLoding"
        let isFirstLoding = !UserDefaults.standard.bool(forKey: isFirstLodingFlag)
        
        guard !isFirstLoding else {
            UserDefaults.standard.set(true, forKey: isFirstLodingFlag)
            UserDefaults.standard.synchronize()
            return true
        }
        
        return false
    }
}
