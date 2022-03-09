import UIKit

final class TabBarRouter {
    typealias Submodules = (
        main: UIViewController,
        video: UIViewController,
        categories: UIViewController,
        profile: UIViewController
    )
}

extension TabBarRouter {
    static func tabs(usingSubmodules submodules: Submodules) -> Tabs {
        let mainTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let videoTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "play"), selectedImage: UIImage(systemName: "play.fill"))
        let categoriesTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        let profileTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        submodules.main.tabBarItem = mainTabBarItem
        submodules.video.tabBarItem = videoTabBarItem
        submodules.categories.tabBarItem = categoriesTabBarItem
        submodules.profile.tabBarItem = profileTabBarItem
        
        return (
            main: submodules.main,
            video: submodules.video,
            categories: submodules.categories,
            profile: submodules.profile
        )
    }
}
