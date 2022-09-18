//
//  UserRepository.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift

protocol UserRepository {
    func requestUsers() -> Single<[User]>
}
