
import UIKit

final class DefaultCellView: UICollectionViewCell, MainBaseCellView {
    var reuseId: String = "default_cell"
    var nibName: String = String(describing: DefaultCellView.self)
    
    func bind(item: DashboardItem) {
        // Do nothing
    }
    
    func size(parent: UIView) -> CGSize {
        CGSize.zero
    }
}
