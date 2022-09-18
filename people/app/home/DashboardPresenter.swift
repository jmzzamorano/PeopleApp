//
//  DashboardPresenter.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift

class DashboardPresenter {
    var dashboardScreen: DashboardScreen?
    var dashboardNavigator: DashboardScreenNavigator?
    var getUsers: GetUsers
    var disposeBag = DisposeBag()
    var currentUsers: [UserItem] = []
    
    init(getUsers: GetUsers) {
        self.getUsers = getUsers
    }   
    
    func bind(screen: DashboardScreen, navigator: DashboardScreenNavigator) {
        self.dashboardScreen = screen
        self.dashboardNavigator = navigator
        setControllerInitialState()
        
        getUsers.users.subscribe {[weak self] users in
            self?.onGetUsersSuccess(users)
        } onError: {[weak self] error in
            self?.onGetUsersError()
        }.disposed(by: disposeBag)
        
        getUsers.execute()
    }
    
    private func setControllerInitialState() {
        dashboardScreen?.registerAvailableCellTypes()
        dashboardScreen?.setHeaderTitle(title: "header_title".localized)
        dashboardScreen?.hideErrorView()
        dashboardScreen?.showLoading(true)
        dashboardScreen?.showAddButton()
    }
    
    private func onGetUsersSuccess(_ users: [UserItem]) {
        self.currentUsers = users

        if (users.isEmpty) {
            self.dashboardScreen?.showUsersError(text: "user_list_empty".localized)
        } else {
            self.dashboardScreen?.showUsers(users: users)
        }

        self.dashboardScreen?.showLoading(false)
    }

    private func onGetUsersError() {
        self.dashboardScreen?.showLoading(false)
        self.dashboardScreen?.showUsersError(text: "users_not_available".localized)
    }
    
    func userPerformsClickOnAddButton() {
        dashboardScreen?.navigateToAddUserScreen()
    }
    
    func userPerformsClickOnCell(index: Int) {
        let user = currentUsers[index]
        dashboardScreen?.navigateToDetailScreen(user: user)
    }
}
