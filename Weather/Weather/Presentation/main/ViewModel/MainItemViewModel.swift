//
//  MainItemViewModel.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation

struct MainItemViewModel {
    let current: Current?
    let daily: [Daily]?
    let hourly: [Hourly]?
}

extension MainItemViewModel {
    init(model: WeatherList?) {
        self.current = model?.current
        self.daily = model?.daily
        self.hourly = model?.hourly
    }
}
