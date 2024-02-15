
import Foundation
import RxSwift

final class GetUsersError: GetUsers {
    func execute() -> Single<[DashboardItem]> {
        let error = NSError(domain: "use_case_error", code: 1000)
        return .error(error)
    }
}
