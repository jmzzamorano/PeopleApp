//
//  AddUserViewController.swift
//  people
//
//  Created by Javier Martinez Zamorano on 17/9/22.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var headerTitleView: UILabel!
    @IBOutlet weak var nameTitleView: UILabel!
    @IBOutlet weak var birthdateTitleView: UILabel!
    @IBOutlet weak var saveUserButton: UIButton!
    
    
    public static func getController() -> AddUserViewController {
        let controller = AddUserViewController.init(
            nibName: String(describing: AddUserViewController.self),
            bundle: Bundle(for: AddUserViewController.self)
        )
        
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitleView.text = "adduser_title".localized
        birthdateTitleView.text = "adduser_birthdate".localized
        nameTitleView.text = "adduser_name".localized
        saveUserButton.setTitle("addUser_save".localized, for: .normal)
    }
}
