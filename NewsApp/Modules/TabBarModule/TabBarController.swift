import UIKit

typealias Tabs = (
    main: UIViewController,
    video: UIViewController,
    categories: UIViewController,
    profile: UIViewController
)

final class TabBarController: UITabBarController {
    init(tabs: Tabs) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = [tabs.main, tabs.video, tabs.categories, tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
