//
//  SceneDelegate.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit
import os.log

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else {
            Logger.shared.log("Failed to cast UIScene to UIWindowScene", level: .error)
            return
        }
        Logger.shared.log("Configuring UIWindowScene.", level: .info)
        window = UIWindow(windowScene: winScene)
        
        let navigation = UINavigationController()
        
        Logger.shared.log("Starting MainCoordinator.", level: .info)
        coordinator = MainCoordinator(navigationController: navigation)
        
        coordinator?.splashScreen()
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        Logger.shared.log("Window made key and visible.", level: .info)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

