//
//  AppCoordinator.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    var childCoordinators: [BaseCoordinator] = []
    var navigationController: UINavigationController
    
    private let diContainer: DIContainer
    
    init(navigationController: UINavigationController, diContainer: DIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let viewController = diContainer.makeMainViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
