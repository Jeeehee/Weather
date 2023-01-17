//
//  SceneDelegate.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import RxCocoa
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    private let appContainer = DIContainer()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        
        checkFirstLoading()
        
        appCoordinator = AppCoordinator(navigationController: navigationController, diContainer: appContainer)
        appCoordinator?.start()
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func checkFirstLoading() {
        if UserDefaults.isFirstLoding() {
            appContainer.saveAPIKey()
        }
    }
}

