//
//  MainCollectionViewDataSource.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class MainCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 4 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = SectionType.init(rawValue: section) else { return 0 }

        switch sectionType {
        case .current: return 1
        case .today: return 16
        case .fiveDays: return 5
        case .detail: return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sections = SectionType.init(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sections {
        case .current:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCell.identifier, for: indexPath) as? CurrentWeatherCell else { return UICollectionViewCell() }
            return cell
        case .today:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWeatherCell.identifier, for: indexPath) as? TodayWeatherCell else { return UICollectionViewCell() }
            return cell
        case .fiveDays:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiveDaysWeatherCell.identifier, for: indexPath) as? FiveDaysWeatherCell else { return UICollectionViewCell() }
            return cell
        case .detail:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailInfoCell.identifier, for: indexPath) as? DetailInfoCell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    
}
