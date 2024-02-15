
import Foundation
import UIKit

protocol DashboardWireframe {
    var parent: UIViewController? { get set }
    
    func navigateToDetailScreen(user: DashboardItem)
    func navigateToAddUserScreen()
}

final class DashboardWireframeDefault: DashboardWireframe {
    weak var parent: UIViewController?
    
    func navigateToDetailScreen(user: DashboardItem) {
        let controller = DetailViewController.getController(forUser: user)
        parent?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func navigateToAddUserScreen() {
        let controller = AddUserViewController.getController()
        parent?.navigationController?.present(controller, animated: true)
    }
}
