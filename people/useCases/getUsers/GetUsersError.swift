//
//  GetUsersError.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift
import RxCocoa

class GetUsersError: GetUsers {
    var users = PublishSubject<[UserItem]>()
    
    func execute() {
        let error = NSError(domain: "use_case_error", code: 1000)
        users.onError(error)
    }
}
