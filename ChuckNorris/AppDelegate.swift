import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var router: Router?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    router = Router()
    let viewModel = JokeListViewModel()
    let jokeListVC = JokeListViewController(viewModel: viewModel, router: router!)
    router!.push(viewController: jokeListVC)
    return true
  }
}
