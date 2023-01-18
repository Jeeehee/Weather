//
//  MainCollectionViewDataSource.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class MainCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var item: MainItemViewModel?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { SectionType.allCases.count }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = SectionType.init(rawValue: section) else { return 0 }

        switch sectionType {
        case .current: return 1
        case .today: return 16
        case .fiveDays: return 5
        case .map: return 1
        case .detail: return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sections = SectionType.init(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sections {
        case .current:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCell.identifier, for: indexPath) as? CurrentWeatherCell else { return UICollectionViewCell() }
            
            cell.configureCell(with: item?.current, and: item?.daily?.first)
            return cell
            
        case .today:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWeatherCell.identifier, for: indexPath) as? TodayWeatherCell else { return UICollectionViewCell() }
            
            cell.configureCell(with: item?.hourly?[indexPath.item], item?.current)
            return cell
            
        case .fiveDays:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiveDaysWeatherCell.identifier, for: indexPath) as? FiveDaysWeatherCell else { return UICollectionViewCell() }
            
            cell.configureCell(with: item?.daily?[indexPath.item + 1])
            return cell
            
        case .map:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCell.identifier, for: indexPath) as? MapCell else { return UICollectionViewCell() }
            return cell
            
        case .detail:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailInfoCell.identifier, for: indexPath) as? DetailInfoCell else { return UICollectionViewCell() }
            
            let image: [UIImage?] = [UIImage.humidity, UIImage.temp, UIImage.pressure, UIImage.wind]
            let title = ["습도", "체감 온도", "기압", "풍속"]
            guard let current = item?.current else { return UICollectionViewCell() }
            let data: [Any] = [
                current.humidity,
                String.fahrenheitTocelsius(fahrenheit: Double(current.feelsLike)),
                current.pressure,
                current.windSpeed]
            cell.configureCell(with: data[indexPath.item], image: image[indexPath.item], title: title[indexPath.item])
            return cell
        }
    }
}
