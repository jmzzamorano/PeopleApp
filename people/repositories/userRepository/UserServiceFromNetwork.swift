//
//  UserServiceFromNetwork.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift
import RxAlamofire

class UserServiceFromNetwork: UserRepository {
    var parser: UserJsonParser
    
    init(parser: UserJsonParser) {
        self.parser = parser
    }
    
    func requestUsers() -> Single<[User]> {
        let baseUrl = AppConfig.shared.getBaseUrl()
        let url = baseUrl + "/api/User"

        return RxAlamofire
            .requestString(.get, url)
            .asSingle()
            .flatMap({(response, jsonString) -> Single<[User]> in
                let data = self.parser.parse(json: jsonString)
                return Single.just(data)
            })
    }
}
