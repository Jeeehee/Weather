//
//  KeyChainStorage.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import RxSwift

final class KeyChainStorage {
    func create(account: String, key: String) {
        guard let data = key.data(using: String.Encoding.utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]
      
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else { return }
        guard status == errSecSuccess else { return }
      
    }

    func read(account: String) -> Single<String> {
        return Single.create { observer in
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecReturnData as String: true,
                kSecReturnAttributes as String: true
            ]
            
            var item: CFTypeRef?
            let error = KeyChainError.self
            
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            guard status != errSecItemNotFound else {
                observer(.failure(error.noPassword))
                
                return Disposables.create {}
            }
            guard status == errSecSuccess else {
                observer(.failure(error.unknown(status)))
                
                return Disposables.create {}
            }
            
            guard let existingItem = item as? [String: Any],
                  let data = existingItem[kSecValueData as String] as? Data,
                  let password = String(data: data, encoding: .utf8) else {
                observer(.failure(error.unexpectedPasswordData))
                return Disposables.create {}
            }
            
            observer(.success(password))
            return Disposables.create {}
        }
    }
}
