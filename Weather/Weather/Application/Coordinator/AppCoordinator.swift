//
//  AppCoordinator.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import RxSwift
import RxRelay

final class AppCoordinator: BaseCoordinator, Navigation {
    private let disposeBag = DisposeBag()
    
    var childCoordinators: [BaseCoordinator] = []
    var navigationController: UINavigationController
    
    let diContainer: DIContainer
    
    // MARK: Navigation
    var showSearchView = PublishRelay<Void>()
    
    init(navigationController: UINavigationController, diContainer: DIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
        
        bind()
    }
    
    func start() {
        let child = MainCoordinator(navigationController: navigationController, navigation: self)
        addChild(child)
        child.parentCoordinator = self
        child.navigation = self
        child.start()
    }
    
    func showSearchViewContoller() {
        let removeChild = MainCoordinator(navigationController: navigationController, navigation: self)
        childDidFinish(removeChild)
        
        let child = SearchCoordinator(navigationController: navigationController, navigation: self)
        addChild(child)
        child.parentCoordinator = self
        child.navigation = self
        child.start()
    }
    
    private func bind() {
        showSearchView
            .withUnretained(self)
            .bind { _, _ in
                self.showSearchViewContoller()
            }
            .disposed(by: disposeBag)
    }
}
