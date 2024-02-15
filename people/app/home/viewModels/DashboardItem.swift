
import Foundation

enum DashboardCellType {
    case medium
    case banner
    case date
}

protocol DashboardItem {
    var type: DashboardCellType { get set }
}
