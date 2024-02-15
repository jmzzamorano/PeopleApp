
import Foundation
import Swinject

final class ContainerFactory {
    public static func make() -> Container {
        let container = Container()
        
        container.register(DashboardCellFactory.self) { r in
            DashboardCellFactoryDefault()
        }
        
        container.register(DashboardWireframe.self) { r in
            DashboardWireframeDefault()
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
            
            // UserServiceFromNetwork(parser: UserJsonParser())
             UserServiceFake(parser: UserJsonParser())
            // UserServiceError()
        }
        
        container.register(UsersMapper.self) { _ in
            GetUsersMapper()
        }
        
        return container
    }
}
