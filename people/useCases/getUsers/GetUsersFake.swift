
import Foundation
import RxSwift

final class GetUsersFake: GetUsers {    
    func execute() -> Single<[DashboardItem]> {        
        return .just(requestUsers(usersCount: 7))
    }

    private func requestUsers(usersCount: Int) -> [DashboardItem] {
        var items: [DashboardItem] = []
        
        for index in 0...usersCount {
            let item: DashboardItem
            
            if index == 0 {
                item = BannerItem(
                    title: "banner_title".localized,
                    subtitle: "banner_subtitle".localized,
                    description: "banner_description".localized,
                    date: "banner_date".localized
                )
            } else {
                item = EmployeeItem(
                    id: getId(),
                    name: getName(index),
                    title: getTeamTitle(index),
                    birthdate: getBirthdate(),
                    description: getDescription(index),
                    image: getProfileImage(index)
                )
            }
            
            items.append(item)
        }
        
        return items
    }
    
    private func getId() -> Int {
        return Int.random(in: 1000..<9000)
    }
    
    private func getName(_ index: Int) -> String {
        return getShortName(index)
    }
    
    private func getShortName(_ index: Int) -> String {
        return FakeData.shortNames[index % FakeData.shortNames.count]
    }
    
    private func getLongName(_ index: Int) -> String {
        return FakeData.longNames[index % FakeData.longNames.count]
    }
    
    private func getBirthdate() -> Date {
        return Date()
    }
    
    private func getTeamTitle(_ index: Int) -> TeamTitle {
        if (index == 0 || index == 3) {
            return TeamTitle.mentor
        } else {
            return TeamTitle.mentee
        }
    }
    
    private func getDescription(_ index: Int) -> String {
        return FakeData.descriptions[index % FakeData.descriptions.count]
    }
    
    private func getProfileImage(_ index: Int) -> String {
        return FakeData.profileImages[index % FakeData.profileImages.count]
    }
}
