
import Foundation
import UIKit

protocol MainBaseCellView: UICollectionViewCell {
    var reuseId: String {get}
    var nibName: String {get}
    
    func bind(item: DashboardItem)
    func size(parent: UIView) -> CGSize
}

extension MainBaseCellView {
    private func registerForCollectionView(collectionView: UICollectionView) {
        var nib: UINib?
        nib = UINib.init(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseId)
    }
    
    func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> MainBaseCellView {
        if !collectionView.isCellRegistered(for: reuseId) {
            registerForCollectionView(collectionView: collectionView)
        }
        
        return collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath
        ) as! MainBaseCellView
    }
}

extension UICollectionView {
    func isCellRegistered(for reuseIdentifier: String) -> Bool {
        return self.visibleCells.contains { $0.reuseIdentifier == reuseIdentifier }
    }
}
