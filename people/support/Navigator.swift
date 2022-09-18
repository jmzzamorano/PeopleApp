//
//  Navigator.swift
//  people
//
//  Created by Javier Martinez Zamorano on 17/9/22.
//

import Foundation
import UIKit

class Navigator {
    static let shared = Navigator()
    
    private init() {}
    
    func navigateToDetailScreen(navController: UINavigationController, user: UserItem) {
        let controller = DetailViewController.getController(forUser: user)
        navController.pushViewController(controller, animated: true)
    }
    
    func navigateToAddUserScreen(navController: UINavigationController) {
        let controller = AddUserViewController.getController()
        navController.present(controller, animated: true)
    }
}
