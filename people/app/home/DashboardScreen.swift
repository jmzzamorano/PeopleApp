
import Foundation

protocol DashboardScreen: AnyObject {
    func showUsers(users: [DashboardItem])
    func showUsersError(text: String)
    func showLoading(_ isLoading: Bool)
    func setHeaderTitle(title: String)
    func hideErrorView()
    func showAddButton()
}
