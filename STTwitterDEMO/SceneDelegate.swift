//
//  SceneDelegate.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        return NSUserActivity(activityType: "")
    }
    
    //MARK: -  0
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        print("willConnectTo")
        
        // WHEN SCENE IS STARTING
    }
    
    //MARK: -  1
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("sceneWillEnterForeground")
        
        // WHEN SCENE IS STARTING AND GOING FROM BACKGROUND
    }

    //MARK: -  2
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("sceneDidBecomeActive")
        
        //WHEN GOES FROM BACKGROUND
    }
    
    //MARK: -  3
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("sceneWillResignActive")
        
        // WHEN SCENE GOES TO "PRE" BACKGROUND
    }
    
    //MARK: -  4
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("sceneDidEnterBackground")
        
        // WHEN SCENE IS IN BACKGROUND
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("sceneDidDisconnect")
    }
}
