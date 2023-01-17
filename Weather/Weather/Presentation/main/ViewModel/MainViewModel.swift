//
//  MainViewModel.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import Foundation
import RxSwift
import RxCocoa

protocol Navigation {
    var showSearchView: PublishRelay<Void> { get }
}

protocol MainViewModelInput {
    var viewDidLoad: PublishRelay<Void> { get }
    var didTapSearchBar: PublishRelay<Void> { get }
}

protocol MainViewModelOutput {
    var weather: BehaviorRelay<[Weather]> { get }
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
    var weather = BehaviorRelay<[Weather]>(value: [])
    
    init(useCase: WeatherUseCase, navigation: Navigation, apiKey: String) {
        self.useCase = useCase
        self.apiKey = apiKey
        
        bind(to: navigation)
    }
}

extension MainViewModel {
    func bind(to navigation: Navigation) {
        
        viewDidLoad
            .flatMapLatest { dd in
                return self.useCase.start(city: "seoul", appKey: self.apiKey)
                    .asObservable()
            }
        
        
        didTapSearchBar
            .bind(to: navigation.showSearchView)
            .disposed(by: disposeBag)
    }
}
