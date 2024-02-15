
import Foundation

struct BannerItem: DashboardItem {
    var type: DashboardCellType = .banner
    let title: String
    let subtitle: String
    let description: String
    let date: String
}
