//
//  BaseCoordinator.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

protocol BaseCoordinator: AnyObject {
    var childCoordinators: [BaseCoordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
}

extension BaseCoordinator {
    func addChild(_ coordinator: BaseCoordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func childDidFinish(_ coordinator: BaseCoordinator) {
        if let childIndex = childCoordinators.enumerated()
            .first(where: {$1 === coordinator})?
            .offset { childCoordinators.remove(at: childIndex) }
    }
}
