//
//  DetailViewController.swift
//  people
//
//  Created by Javier Martinez Zamorano on 17/9/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var user: UserItem!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var shadowImageView: UIView!
    @IBOutlet weak var nameTitleView: UILabel!
    @IBOutlet weak var teamTitleView: UILabel!
    @IBOutlet weak var descriptionTitleView: UILabel!
    
    public static func getController(forUser user: UserItem) -> DetailViewController {
        let controller = DetailViewController.init(
            nibName: String(describing: DetailViewController.self),
            bundle: Bundle(for: DetailViewController.self)
        )
        
        controller.user = user
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    
    private func customizeViews() {
        let imageUrl = URL(string: user.image)
        profileImageView.kf.setImage(with: imageUrl, options: [
            .transition(ImageTransition.fade(0.3)),
            .forceTransition,
            .keepCurrentImageWhileLoading
        ])
        
        let grayColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1).cgColor
        let gradient = CAGradientLayer()
        gradient.frame = shadowImageView.bounds
        gradient.colors = [UIColor.clear.cgColor, grayColor]
        gradient.locations = [0.0, 0.7]
        shadowImageView.layer.insertSublayer(gradient, at: 0)
        
        nameTitleView.text = user.name
        teamTitleView.text = "Team Rol / " + user.title.description
        descriptionTitleView.text = user.description
    }
}
