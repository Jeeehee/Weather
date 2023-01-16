//
//  MainViewController.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

class MainViewController: UIViewController {
    private let dataSource = MainCollectionViewDataSource()
    
    private let collectionView: UICollectionView = {
        let layout = LayoutFactory.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    private func setUpgradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.gradientBlue.cgColor,
                                UIColor.gradientPurple.cgColor]
        view.layer.addSublayer(gradientLayer)
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .clear
        collectionView.register(CurrentWeatherCell.self, forCellWithReuseIdentifier: CurrentWeatherCell.identifier)
        collectionView.register(TodayWeatherCell.self, forCellWithReuseIdentifier: TodayWeatherCell.identifier)
        collectionView.register(FiveDaysWeatherCell.self, forCellWithReuseIdentifier: FiveDaysWeatherCell.identifier)
        collectionView.register(DetailInfoCell.self, forCellWithReuseIdentifier: DetailInfoCell.identifier)
    }
    
    private func layout() {
        setUpgradientLayer()
        setUpCollectionView()
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }

}

