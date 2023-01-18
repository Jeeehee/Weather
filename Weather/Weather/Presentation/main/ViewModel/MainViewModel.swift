//
//  MainViewModel.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxCocoa
import RxSwift

protocol Navigation {
    var showSearchView: PublishRelay<Void> { get }
}

protocol MainViewModelInput {
    var viewDidLoad: PublishRelay<Void> { get }
    var didTapSearchBar: PublishRelay<Void> { get }
}

protocol MainViewModelOutput {
    var item: BehaviorRelay<MainItemViewModel> { get }
}

protocol MainViewModelProtocol: MainViewModelInput, MainViewModelOutput {
    var input: MainViewModelInput { get }
    var output: MainViewModelOutput { get }
}

final class MainViewModel: MainViewModelProtocol {
    var input: MainViewModelInput { self }
    var output: MainViewModelOutput { self }
    
    private let disposeBag = DisposeBag()
    private let useCase: WeatherUseCase
    private let apiKey: String
    
    // MARK: InPut
    let viewDidLoad = PublishRelay<Void>()
    let didTapSearchBar = PublishRelay<Void>()
    
    // MARK: OutPut
    var item = BehaviorRelay<MainItemViewModel>(value: MainItemViewModel(model: nil))
    
    init(useCase: WeatherUseCase, navigation: Navigation, apiKey: String) {
        self.useCase = useCase
        self.apiKey = apiKey
        
        bind(to: navigation)
    }
}

extension MainViewModel {
    func bind(to navigation: Navigation) {
        useCase
            .start(WeatherList.self, lat: "36.783611", lon: "127.004173", apiKey: apiKey)
            .subscribe { event in
                switch event {
                case .success(let data):
                    let weatherData = MainItemViewModel(model: data)
                    self.item.accept(weatherData)
                case .failure(let error):
                    let error = NetworkError.error(error)
                    fatalError("\(error.localizedDescription)")
                }
            }
            .disposed(by: disposeBag)
           
        didTapSearchBar
            .bind(to: navigation.showSearchView)
            .disposed(by: disposeBag)
    }
}
