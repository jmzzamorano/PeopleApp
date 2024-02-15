
import Foundation
import RxSwift

protocol GetUsers {
    func execute() -> Single<[DashboardItem]>
}
