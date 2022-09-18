//
//  GetUsersFake.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift
import RxCocoa

class GetUsersFake: GetUsers {
    var users = PublishSubject<[UserItem]>()
    
    func execute() {
        users.onNext(requestUsers(usersCount: 7))
    }

    private func requestUsers(usersCount: Int) -> [UserItem] {
        var users: [UserItem] = []
        
        for index in 0...usersCount {
            let user = UserItem(
                id: getId(),
                name: getName(index),
                title: getTeamTitle(index),
                birthdate: getBirthdate(),
                description: getDescription(index),
                image: getProfileImage(index)
            )
            
            users.append(user)
        }
        
        return users
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
