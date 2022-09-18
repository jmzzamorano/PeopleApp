//
//  GetUsers.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol GetUsers {
    var users: PublishSubject<[UserItem]> { get }
    
    func execute()
}
