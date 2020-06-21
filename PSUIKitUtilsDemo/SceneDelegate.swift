//
//  SceneDelegate.swift
//  PSUIKitUtilsDemo
//
//  Created by Philipp Schunker on 21.06.20.
//  Copyright © 2020 Philipp Schunker. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let mainViewController = ViewController()
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        let mainTabBarItemLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        //mainTabBarItemLabel.font = rentalTabBarItemLabel.font.withSize(14)
        mainTabBarItemLabel.text = "🚀"
        mainTabBarItemLabel.textAlignment = NSTextAlignment.center
        
        let mainTabBarItemImage = UIImage.imageWithLabel(label: mainTabBarItemLabel)
        
        navigationController.tabBarItem = UITabBarItem(title: "PSUIKitUtilsDemo", image: mainTabBarItemImage, tag: 0)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]
        
        self.window?.rootViewController = tabBarController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
