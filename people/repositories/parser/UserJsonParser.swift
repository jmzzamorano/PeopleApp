//
//  UserJsonParser.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import SwiftyJSON

class UserJsonParser {
    func parse(json: String) -> [User] {
        let users = JSON(parseJSON: json)
        
        return users.map {(arg0) -> JSON in
            let(_, jsonItem) = arg0
            return jsonItem
        }.filter {
            byValidUser(item: $0)
        }.map {(item:JSON) -> User in
            return buildUser(item)
        }
    }
    
    private func byValidUser(item: JSON) -> Bool {
        return isValidId(item) && isValidDate(item) && isValidName(item)
    }
    
    private func isValidId(_ item: JSON) -> Bool {
        return item["id"].exists() && item["id"].int != nil
    }
    
    private func isValidName(_ item: JSON) -> Bool {
        return item["name"].exists() && item["name"].string != nil
    }
    
    private func isValidDate(_ item: JSON) -> Bool {
        return item["birthdate"].exists() && item["birthdate"].string != nil
    }
    
    private func buildUser(_ item: JSON) -> User {
        return User(
            id: item["id"].int ?? 0,
            name: item["name"].string ?? "unknown",
            birthdate: item["birthdate"].string ?? "unknown")
    }
}
