//
//  WeatherRepositoryImpl.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import RxSwift

protocol ResponseDecoder {
    func decode<T: Decodable>(_ type: T.Type, data: Data?) -> T?
}

final class WeatherRepositoryImpl {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension WeatherRepositoryImpl: WeatherRepository, ResponseDecoder {
    func fetchList<T: Decodable>(_ type: T.Type, endPoint: Requestable) -> Single<T> {
        return Single<T>.create { observer in
            self.networkService
                .request(endPoint: endPoint)
                .subscribe { result in
                    switch result {
                    case .success(let data):
                        guard let decodeData = self.decode(T.self, data: data) else {
                            let error = NetworkError.decodeFailed
                            observer(.failure(error))
                            return }
                        observer(.success(decodeData))
                        
                    case .failure(_):
                        let error = NetworkError.decodeFailed
                        observer(.failure(error))
                    }
                }
        }
    }
    
    func decode<T: Decodable>(_ type: T.Type, data: Data?) -> T? {
        guard let data = data,
              let decodedData = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return decodedData
    }
}
