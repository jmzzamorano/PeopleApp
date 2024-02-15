
import UIKit

final class DateCellView: UICollectionViewCell, MainBaseCellView {
    var reuseId: String = "date_cell"
    var nibName: String = String(describing: DateCellView.self)
    
    @IBOutlet private weak var titleView: UILabel!
    
    func bind(item: DashboardItem) {
        guard let dateItem = item as? DateItem else {
            return
        }
        
        titleView.text = dateItem.timeAgo
    }
    
    func size(parent: UIView) -> CGSize {
        return CGSize(
            width: parent.frame.width,
            height: 30
        )
    }
}
