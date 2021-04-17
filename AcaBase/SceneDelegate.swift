//
//  SceneDelegate.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit
import Firebase

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        FirebaseApp.configure()
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let Loginstoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        // if user is logged in before
        if let _ = UserManager.shared.token {
            // instantiate the main tab bar controller and set it as root view controller
            // using the storyboard identifier we set earlier
            let mainTabBarController = homeStoryboard.instantiateViewController(identifier: "HomeTabBarController")
            window?.rootViewController = mainTabBarController
        } else {
            // if user isn't logged in
            // instantiate the navigation controller and set it as root view controller
            // using the storyboard identifier we set earlier
            let loginNavController = Loginstoryboard.instantiateViewController(identifier: "LoginNavigationController")
            window?.rootViewController = loginNavController
        }
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }

        window.rootViewController = vc

        // add animation
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: nil,
                          completion: nil)

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

        // Save changes in the application's managed object context when the application transitions to the background.
        CoreDataStore.saveContext()
    }


}

