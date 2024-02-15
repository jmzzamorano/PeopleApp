
import UIKit

final class AddUserViewController: UIViewController {
    @IBOutlet private weak var headerTitleView: UILabel!
    @IBOutlet private weak var nameTitleView: UILabel!
    @IBOutlet private weak var birthdateTitleView: UILabel!
    @IBOutlet private weak var saveUserButton: UIButton!
    
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
        
        saveUserButton.addTarget(self, action: #selector(saveUserButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveUserButtonTapped() {
        showAlert(message: "adduser_alert".localized)
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
