
import UIKit
import Kingfisher

final class DetailViewController: UIViewController {
    var user: DashboardItem?
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var shadowImageView: UIView!
    @IBOutlet private weak var nameTitleView: UILabel!
    @IBOutlet private weak var teamTitleView: UILabel!
    @IBOutlet private weak var descriptionTitleView: UILabel!
    
    public static func getController(forUser user: DashboardItem) -> DetailViewController {
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
        guard let employee = user as? EmployeeItem else {
            return
        }
        
        let imageUrl = URL(string: employee.image)
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
        
        nameTitleView.text = employee.name
        teamTitleView.text = "Team Rol / " + employee.title.description
        descriptionTitleView.text = employee.description
    }
}
