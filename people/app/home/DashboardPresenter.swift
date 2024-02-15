
import Foundation
import RxSwift

protocol DashboardPresenter {
    var view: DashboardScreen? { get set }
    var items: [DashboardItem] { get }
    
    func bind()
    func userPerformsClickOnAddButton()
    func userPerformsClickOnCell(index: Int)
}

final class DashboardPresenterDefault: DashboardPresenter {
    weak var view: DashboardScreen?
    var items: [DashboardItem] = []
    
    private var dashboardWireframe: DashboardWireframe?
    private var getUsers: GetUsers
    private var disposeBag = DisposeBag()
    
    init(getUsers: GetUsers, wireframe: DashboardWireframe) {
        self.getUsers = getUsers
        self.dashboardWireframe = wireframe
    }
    
    func bind() {
        setControllerInitialState()
        
        getUsers
            .execute()
            .subscribe {[weak self] items in
                guard let self = self else { return }
                self.onGetUsersSuccess(items)
                
            } onFailure: {[weak self] _ in
                guard let self = self else { return }
                self.onGetUsersError()
                
            }.disposed(by: disposeBag)
    }
    
    private func setControllerInitialState() {
        view?.setHeaderTitle(title: "header_title".localized)
        view?.hideErrorView()
        view?.showLoading(true)
        view?.showAddButton()
    }
    
    private func onGetUsersSuccess(_ items: [DashboardItem]) {
        self.items = items

        if (items.isEmpty) {
            view?.showUsersError(text: "user_list_empty".localized)
        } else {
            view?.showUsers(users: items)
        }

        view?.showLoading(false)
    }

    private func onGetUsersError() {
        view?.showLoading(false)
        view?.showUsersError(text: "users_not_available".localized)
    }
    
    func userPerformsClickOnAddButton() {
        dashboardWireframe?.navigateToAddUserScreen()
    }
    
    func userPerformsClickOnCell(index: Int) {
        let user = items[index]
        
        if user.type == .medium {
            dashboardWireframe?.navigateToDetailScreen(user: user)
        }
    }
}
