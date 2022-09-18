//
//  GetUsersFromNetwork.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift
import RxCocoa

class GetUsersFromNetwork: GetUsers {
    let users = PublishSubject<[UserItem]>()
    let disposeBag = DisposeBag()
    let userRepository: UserRepository
    let mapper: UsersMapper
    
    init(userRepository: UserRepository, mapper: UsersMapper) {
        self.userRepository = userRepository
        self.mapper = mapper
    }
    
    func execute() {
        userRepository.requestUsers()
            .subscribe(onSuccess: onSuccess, onFailure: onFailure, onDisposed: onDisposed)
            .disposed(by: disposeBag)
    }
    
    private func onSuccess(data: [User]) {
        users.onNext(mapper.map(data))
    }
    
    private func onFailure(error: Error) {
        users.onError(error)
    }
    
    private func onDisposed() {
        // Do nothing
    }
}
