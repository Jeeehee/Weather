//
//  SearchCoordinator.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/17.
//

import UIKit

final class SearchCoordinator: BaseCoordinator {
    var childCoordinators: [BaseCoordinator] = []
    var navigationController: UINavigationController
    var navigation: Navigation
    
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController, navigation: Navigation) {
        self.navigationController = navigationController
        self.navigation = navigation
    }
    
    func start() {
        guard let parentCoordinator = parentCoordinator else { return }
        
        let viewController = parentCoordinator.diContainer.makeSearchViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
