
import UIKit

class BannerCellView: UICollectionViewCell, MainBaseCellView {
    var reuseId: String = "banner_cell"
    var nibName: String = String(describing: BannerCellView.self)
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleView: UILabel!
    @IBOutlet private weak var dateView: UILabel!
    @IBOutlet private weak var notificationTitleView: UILabel!
    @IBOutlet private weak var notificationSubtitleView: UILabel!
    
    func bind(item: DashboardItem) {
        guard let bannerItem = item as? BannerItem else {
            return
        }
                
        containerView.layer.cornerRadius = 12.0
        customizeInfo(info: bannerItem)
    }
    
    func size(parent: UIView) -> CGSize {
        return CGSize(width: parent.frame.width, height: 114.0)
    }
    
    private func customizeInfo(info: BannerItem) {
        titleView.text = info.title
        dateView.text = info.date
        notificationTitleView.text = info.subtitle
        notificationSubtitleView.text = info.description
    }
}
