//
//  UserItem.swift
//  people
//
//  Created by Javier Martinez Zamorano on 15/9/22.
//

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

struct UserItem {
    let id: Int
    let name: String
    let title: TeamTitle
    let birthdate: Date
    let description: String
    let image: String
}
