//
//  WeatherRepository.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxSwift

protocol WeatherRepository {
    func fetchList<T: Decodable>(_ type: T.Type,endPoint: Requestable) -> Single<T>
}
