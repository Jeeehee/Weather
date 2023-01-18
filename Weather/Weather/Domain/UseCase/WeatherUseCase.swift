//
//  WeatherUseCase.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxSwift

final class WeatherUseCase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository) {
        self.repository = repository
    }
}

extension WeatherUseCase {
    func start<T: Decodable>(_ type: T.Type, lat: String, lon: String, apiKey: String) -> Single<T> {
        return Single<T>.create { observer in
            self.repository
                .fetchList(T.self, endPoint: EndPoint.weather(lat: lat, lon: lon, apiKey: apiKey))
                .subscribe { result in
                    switch result {
                    case .success(let data):
                        observer(.success(data))
                    case .failure(let error):
                        let error = NetworkError.error(error)
                        observer(.failure(error))
                    }
                }
        }
    }
}
