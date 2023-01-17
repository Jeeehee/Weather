//
//  WeatherRepository.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxSwift

protocol WeatherRepository {
    func fetchList(endPoint: Requestable) -> Single<Weather>
}
