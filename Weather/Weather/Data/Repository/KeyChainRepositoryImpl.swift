//
//  KeyChainRepositoryImpl.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import RxSwift

final class KeyChainRepositoryImpl {
    private let keyChainStorage: KeyChainStorage
    
    init(keyChainStorage: KeyChainStorage) {
        self.keyChainStorage = keyChainStorage
    }
}

extension KeyChainRepositoryImpl: KeyChainRepository {
    func createKey(account: String, key: String) {
        keyChainStorage.create(account: account, key: key)
    }
    
    func readKey(account: String) -> Single<String> {
        return keyChainStorage.read(account: account)
    }
    
}
