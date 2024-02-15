
import Foundation
import RxSwift

final class UserServiceError: UserRepository {
    func execute() -> Single<[User]> {
        let error = NSError(domain: "service_error", code: 1000)
        return Single.error(error)
    }
}
