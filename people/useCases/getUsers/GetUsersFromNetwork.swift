
import Foundation
import RxSwift

final class GetUsersFromNetwork: GetUsers {
    private let disposeBag = DisposeBag()
    private let userRepository: UserRepository
    private let mapper: UsersMapper
    
    init(userRepository: UserRepository, mapper: UsersMapper) {
        self.userRepository = userRepository
        self.mapper = mapper
    }
    
    func execute() -> Single<[DashboardItem]> {
        return userRepository
            .execute()
            .map {[weak self] users in
                guard let self = self else {
                    return []
                }
                
                return self.mapper.map(users)
            }
    }
}
