//
//  MainViewController.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxAppState
import Alamofire

class MainViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let dataSource = MainCollectionViewDataSource()
    private var viewModel: MainViewModelProtocol?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Text.SearchBar.placeholder
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    private let collectionView: UICollectionView = {
        let layout = LayoutFactory.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    convenience init(viewModel: MainViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        bind()
    }
    
    private func bind() {
        guard let viewModel = viewModel else { return }
        
        rx.viewDidLoad
            .bind(to: viewModel.viewDidLoad)
            .disposed(by: disposeBag)
        
        searchBar.rx.textDidBeginEditing
            .bind(to: viewModel.didTapSearchBar)
            .disposed(by: disposeBag)
        
        print("Count is \(viewModel.weather.value.count)")
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
}

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
