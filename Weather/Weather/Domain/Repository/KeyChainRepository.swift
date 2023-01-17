//
//  KeyChainRepository.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import RxSwift

protocol KeyChainRepository {
    func createKey(account: String, key: String)
    func readKey(account: String) -> Single<String>
}
