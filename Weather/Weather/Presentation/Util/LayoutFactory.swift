//
//  LayoutFactory.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class LayoutFactory {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (index, _) -> NSCollectionLayoutSection? in
            guard let sections = SectionType(rawValue: index) else { return nil }
            
            switch sections {
            case .current: return creatCurrentCellLayout()
            case .today: return createTodayCellLayout()
            case .fiveDays: return createFiveDaysCellLayout()
            case .map: return createMapCellLayout()
            case .detail: return createDetailCellLayout()
            }
        }
    }
    
    static func creatCurrentCellLayout() -> NSCollectionLayoutSection {
        let inset: CGFloat = 30
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: inset, bottom: inset, trailing: inset)
        
        return section
    }
    
    static func createTodayCellLayout() -> NSCollectionLayoutSection {
        let inset: CGFloat = 30
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.22),
            heightDimension: .absolute(120))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: inset, bottom: 40, trailing: 0)
        
        return section
    }
    
    static func createFiveDaysCellLayout() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(55))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 30, bottom: inset, trailing: 30)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 30
        
        return section
    }
    
    static func createMapCellLayout() -> NSCollectionLayoutSection {
        let inset: CGFloat = 30
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: inset, bottom: 0, trailing: inset)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = inset
        
        return section
    }
    
    static func createDetailCellLayout() -> NSCollectionLayoutSection {
        let inset: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(140))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: inset, bottom: inset, trailing: inset)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        
        return section
    }
}
