
import Foundation
import UIKit

protocol DashboardCellFactory {
    var cellTypes: [DashboardCellType : MainBaseCellView] { get set }
    
    func getCellView(for parent: UICollectionView,
                     with user: DashboardItem, forItemAt indexPath: IndexPath) -> UICollectionViewCell
    func getCellSize(for parent: UICollectionView, with user: DashboardItem) -> CGSize
}

final class DashboardCellFactoryDefault: DashboardCellFactory {
    var cellTypes: [DashboardCellType : MainBaseCellView] = [:]
    
    func getCellView(for parent: UICollectionView,
                     with user: DashboardItem, forItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellType = cellTypes[user.type] ?? DefaultCellView()
        let cell = cellType.dequeueCell(collectionView: parent, indexPath: indexPath)
        cell.bind(item: user)
        
        return cell
    }
    
    func getCellSize(for parent: UICollectionView, with user: DashboardItem) -> CGSize {
        guard let cell = cellTypes[user.type] else {
            return CGSize.zero
        }
        
        return cell.size(parent: parent)
    }
}
