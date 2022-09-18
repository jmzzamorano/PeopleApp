//
//  GetUsersMapper.swift
//  people
//
//  Created by Javier Martinez Zamorano on 15/9/22.
//

import Foundation

class GetUsersMapper: UsersMapper {
    func map(_ users: [User]) -> [UserItem] {
        return users.enumerated().map {(index, item) in
            mapUser(item, index: index)
        }
    }
    
    private func mapUser(_ user: User, index: Int) -> UserItem {
        return UserItem(
            id: user.id,
            name: user.name,
            title: getTeamTitle(index),
            birthdate: getBirthdate(user.birthdate),
            description: getDescription(index),
            image: getProfileImage(index)
        )
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
