//
//  DIContainer.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class DIContainer {
    // MARK: - Service
    private let networkService = NetworkService()
    
    // MARK: - Persistent Storage
    private let keyChainStorage = KeyChainStorage()
    
    // MARK: - Repositories
    func makeWeatherRepository() -> WeatherRepository {
        return WeatherRepositoryImpl(networkService: networkService)
    }

    func makeKeyChainRepository() -> KeyChainRepository {
        return KeyChainRepositoryImpl(keyChainStorage: keyChainStorage)
    }
    
    // MARK: - UseCases
    func makeWeatherUseCase() -> WeatherUseCase {
        return WeatherUseCase(repository: makeWeatherRepository())
    }
    
    // MARK: - ViewModels
    func makeMainViewModel(navigation: Navigation) -> MainViewModel {
        return MainViewModel(useCase: makeWeatherUseCase(), navigation: navigation, apiKey: getAPIKey())
    }
    
    // MARK: - MainViewController
    func makeMainViewController(navigation: Navigation) -> MainViewController {
        return MainViewController(viewModel: makeMainViewModel(navigation: navigation))
    }
    
    // MARK: - SearchViewController
    func makeSearchViewController() -> SearchViewController {
        return SearchViewController()
    }
    
    // MARK: - Secret
    func makeSecret() -> Secret {
        return Secret(keyChainRepository: makeKeyChainRepository())
    }
    
    func saveAPIKey() {
        return makeSecret().saveAPIKey()
    }
    
    func getAPIKey() -> String {
        return makeSecret().readAPIKey()
    }
}
