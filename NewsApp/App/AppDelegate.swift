import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let submodules = (
            main: UINavigationController(rootViewController: MainViewController()),
            video: UINavigationController(rootViewController: VideoViewController()),
            categories: UINavigationController(rootViewController: CategoriesViewController()),
            profile: UINavigationController(rootViewController: ProfileViewController())
        )
        
        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}
