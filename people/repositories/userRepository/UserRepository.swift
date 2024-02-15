
import Foundation
import RxSwift

protocol UserRepository {
    func execute() -> Single<[User]>
}
