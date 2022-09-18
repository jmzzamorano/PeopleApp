//
//  DashboardScreen.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation

protocol DashboardScreen {
    func showUsers(users: [UserItem])
    func showUsersError(text: String)
    func showLoading(_ isLoading: Bool)
    func registerAvailableCellTypes()
    func setHeaderTitle(title: String)
    func hideErrorView()
    func showAddButton()
    func navigateToDetailScreen(user: UserItem)
    func navigateToAddUserScreen()
}
