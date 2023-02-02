//
//  MainViewController.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
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
        
        searchBar.rx.searchButtonClicked
            .bind(to: viewModel.didTapSearchBar)
            .disposed(by: disposeBag)
        
        viewModel.item
            .withUnretained(self)
            .subscribe { owner, data in
                owner.dataSource.item = data
                
                DispatchQueue.main.async {
                    owner.collectionView.reloadData()
                }
            }
            .disposed(by: disposeBag)
        
        collectionView.rx
            .willBeginDragging
            .withUnretained(self)
            .subscribe { owner, _ in
                owner.view.endEditing(true)
                owner.searchBar.resignFirstResponder()
            }
            .disposed(by: disposeBag)
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
        collectionView.register(MapCell.self, forCellWithReuseIdentifier: MapCell.identifier)
        collectionView.register(DetailInfoCell.self, forCellWithReuseIdentifier: DetailInfoCell.identifier)
    }
    
    private func layout() {
        setUpView()
        setUpgradientLayer()
        setUpCollectionView()
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
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
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
