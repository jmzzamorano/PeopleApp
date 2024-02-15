
import Foundation

enum TeamTitle {
    case mentor
    case mentee
    
    var description: String {
        switch self {
        case .mentor:
            return "mentor".localized
        
        case .mentee:
            return "mentee".localized
        }
    }
}

struct EmployeeItem: DashboardItem {
    let id: Int
    var type: DashboardCellType = .medium
    let name: String
    let title: TeamTitle
    let birthdate: Date
    let description: String
    let image: String
}
