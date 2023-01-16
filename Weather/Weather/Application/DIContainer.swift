//
//  DIContainer.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit

final class DIContainer {
    // MARK: - MainViewController
    func makeMainViewController() -> MainViewController {
        return MainViewController()
    }
    
    // MARK: - SearchViewController
    func makeSearchViewController() -> SearchViewController {
        return SearchViewController()
    }
}
