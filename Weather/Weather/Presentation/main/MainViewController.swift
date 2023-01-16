//
//  MainViewController.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

class MainViewController: UIViewController {
    private let dataSource = MainCollectionViewDataSource()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Text.SearchBar.placeholder
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
//        searchBar.setValue("취소", forKey: "cancelButtonText")
//        searchBar.setShowsCancelButton(true, animated: true)
        return searchBar
    }()
    
    private let collectionView: UICollectionView = {
        let layout = LayoutFactory.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    private func setUpView() {
        navigationItem.titleView = searchBar
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
        setUpView()
        setUpgradientLayer()
        setUpCollectionView()
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        searchBar.resignFirstResponder()
    }

}

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.becomeFirstResponder()
    }
}
