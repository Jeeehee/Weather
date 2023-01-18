//
//  Secret.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxSwift

struct Secret {
    private let keyChainRepository: KeyChainRepository
    
    private let account = "APIKey"
    private let apiKey = "4f728cb2e78aa315e2e2ede5053d3861"
    
    init(keyChainRepository: KeyChainRepository) {
        self.keyChainRepository = keyChainRepository
    }
    
    func saveAPIKey() {
        keyChainRepository.createKey(account: account, key: apiKey)
    }
    
    func readAPIKey() -> String {
        var key = String()
        
        keyChainRepository
            .readKey(account: account)
            .subscribe { result in
                switch result {
                case .success(let value):
                    key = value
                case .failure(let error):
                    let error = KeyChainError.error(error)
                    fatalError("\(error.localizedDescription)")
                }
            }
        return key
    }
}
