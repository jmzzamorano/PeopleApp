
import Foundation
import SwiftyJSON

final class UserJsonParser {
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
        return isValidId(item)
    }
    
    private func isValidId(_ item: JSON) -> Bool {
        return item["id"].exists() && item["id"].int != nil
    }
    
    private func buildUser(_ item: JSON) -> User {
        return User(
            id: item["id"].int ?? 0,
            name: item["name"].string ?? "unknown",
            birthdate: item["birthdate"].string ?? "unknown",
            type: item["type"].string ?? "",
            title: item["title"].string,
            subtitle: item["subtitle"].string,
            description: item["description"].string,
            date: item["date"].string
        )
    }
}
