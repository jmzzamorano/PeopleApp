
import Foundation

final class GetUsersMapper: UsersMapper {
    func map(_ users: [User]) -> [DashboardItem] {
        return users.enumerated().map {(index, item) in
            mapUser(item, index: index)
        }
    }
    
    private func mapUser(_ user: User, index: Int) -> DashboardItem {
        switch user.type {
        case "banner":
            return BannerItem(
                title: user.title ?? "banner_title".localized,
                subtitle: user.subtitle ?? "banner_subtitle".localized,
                description: user.description ?? "banner_description".localized,
                date: user.date ?? "banner_date".localized
            )
        case "date":
            return DateItem(timeAgo: user.date ?? "date_cell_title_2".localized)
            
        default:
            return EmployeeItem(
                id: user.id,
                name: user.name ?? "Employee",
                title: getTeamTitle(index),
                birthdate: getBirthdate(user.birthdate ?? ""),
                description: getDescription(index),
                image: getProfileImage(index)
            )
        }
    }
    
    private func getTeamTitle(_ index: Int) -> TeamTitle {
        var title: TeamTitle
        
        if index == 0 || index == 3 {
            title = TeamTitle.mentor
        } else {
            title = TeamTitle.mentee
        }
        
        return title
    }
    
    private func getBirthdate(_ date: String) -> Date {
        return Date()
    }
    
    private func getDescription(_ index: Int) -> String {
        return FakeData.descriptions[index % FakeData.descriptions.count]
    }
    
    private func getProfileImage(_ index: Int) -> String {
        return FakeData.profileImages[index % FakeData.profileImages.count]
    }
}
