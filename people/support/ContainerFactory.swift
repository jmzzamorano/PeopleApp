//
//  ContainerFactory.swift
//  people
//
//  Created by Javier Martinez Zamorano on 12/9/22.
//

import Foundation
import Swinject

class ContainerFactory {
    public static func make() -> Container {
        let container = Container()
        
        container.register(DashboardPresenter.self) { r in
            DashboardPresenter(getUsers: r.resolve(GetUsers.self)!)
        }
        
        container.register(GetUsers.self) { r in
            // Here you can choose between the different available use cases
            // to test the app.
            GetUsersFromNetwork(
                userRepository: r.resolve(UserRepository.self)!,
                mapper: r.resolve(UsersMapper.self)!
            )
            // GetUsersFake()
            // GetUsersError()
        }
        
        container.register(UserRepository.self) { _ in
            // Here you can choose between the different available services
            // to test the app.
            UserServiceFromNetwork(parser: UserJsonParser())
            // UserServiceFake(parser: UserJsonParser())
            // UserServiceError()
        }
        
        container.register(UsersMapper.self) { _ in
            GetUsersMapper()
        }
        
        return container
    }
}
