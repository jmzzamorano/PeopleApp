
import UIKit
import Kingfisher

final class MediumCellView: UICollectionViewCell, MainBaseCellView {
    var reuseId: String = "medium_cell"
    var nibName: String = String(describing: MediumCellView.self)
    
    @IBOutlet private weak var titleView: UILabel!
    @IBOutlet private weak var teamTitleView: UILabel!
    @IBOutlet private weak var descriptionTitleView: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var backgroundContainerView: UIView!
    @IBOutlet private weak var profileHolderView: UIView!
    
    func bind(item: DashboardItem) {
        guard let employee = item as? EmployeeItem else {
            return
        }
        
        customizeUserInfo(user: employee)
        customizeBackgroundPlaceHolder()
        customizeProfileImage(image: employee.image)
        customizeBackgroundContainer()
    }
    
    func size(parent: UIView) -> CGSize {
        let width = parent.frame.width
        let height = 160.0
        
        return CGSize(width: width, height: height)
    }
    
    private func customizeUserInfo(user: EmployeeItem) {
        titleView.text = user.name
        teamTitleView.text = user.title.description
        descriptionTitleView.text = user.description
    }
    
    private func customizeProfileImage(image: String) {
        let imageUrl = URL(string: image)
        profileImageView.layer.cornerRadius = 8.0
        profileImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        profileImageView.clipsToBounds = true
        profileImageView.kf.setImage(with: imageUrl, options: [
            .transition(ImageTransition.fade(0.3)),
            .forceTransition,
            .keepCurrentImageWhileLoading
        ])
    }
    
    private func customizeBackgroundPlaceHolder() {
        profileHolderView.layer.cornerRadius = 8.0
        profileHolderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func customizeBackgroundContainer() {
        backgroundContainerView.layer.cornerRadius = 6.0
        backgroundContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
}
