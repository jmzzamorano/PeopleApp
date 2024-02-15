
import Foundation

protocol UsersMapper {
    func map(_ users: [User]) -> [DashboardItem]
}
