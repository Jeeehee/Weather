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
    func start(city: String, appKey: String) -> Single<Weather> {
        return Single.create { observer in
            self.repository
                .fetchList(endPoint: EndPoint.weather(
                    city: city, appKey: appKey))
                .subscribe { result in
                    switch result {
                    case .success(let data):
                        observer(.success(data))
                    case .failure(_):
                        let error = NetworkError.reponseFailed
                        observer(.failure(error))
                    }
                }
        }
    }
}
