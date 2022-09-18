//
//  UserServiceError.swift
//  people
//
//  Created by Javier Martinez Zamorano on 12/9/22.
//

import Foundation
import RxSwift

class UserServiceError: UserRepository {
    func requestUsers() -> Single<[User]> {
        let error = NSError(domain: "service_error", code: 1000)
        return Single.error(error)
    }
}
