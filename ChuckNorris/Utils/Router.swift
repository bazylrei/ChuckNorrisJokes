import UIKit

protocol Routing {
    func push(viewController: UIViewController)
    func presentError(_ error: Error, completion: ((UIAlertAction) -> Void)?)
}

class Router: Routing {
    var navigationController: UINavigationController
    private var window: UIWindow?
    
    init() {
        self.navigationController = UINavigationController()
        initiate(with: navigationController)
    }
    
    func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentError(_ error: Error, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alert.addAction(okAction)
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    private func initiate(with navigationController: UINavigationController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        window!.rootViewController = navigationController
    }
}
