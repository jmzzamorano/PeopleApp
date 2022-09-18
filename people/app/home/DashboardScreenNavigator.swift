//
//  DashboardScreenNavigator.swift
//  people
//
//  Created by Javier Martinez Zamorano on 17/9/22.
//

import Foundation

protocol DashboardScreenNavigator {
    func navigateToDetailScreen(user: UserItem)
    func navigateToAddUserScreen()
}
