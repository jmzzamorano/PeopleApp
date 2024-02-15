
import UIKit

final class DashboardViewController: UIViewController, DashboardScreen {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var headerTitleView: UILabel!
    @IBOutlet private weak var loadingView: UIActivityIndicatorView!
    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var errorTitleView: UILabel!
    @IBOutlet private weak var addButtonView: UIButton!
    
    var presenter: DashboardPresenter?
    var cellFactory: DashboardCellFactory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.bind()
    }
    
    func showUsers(users: [DashboardItem]) {
        collectionView.reloadData()
    }
    
    func showUsersError(text: String) {
        errorView.isHidden = false
        errorTitleView.text = text
    }
    
    func setHeaderTitle(title: String) {
        headerTitleView.text = title
    }
    
    func showLoading(_ isLoading: Bool) {
        if isLoading {
            loadingView.startAnimating()
            loadingView.isHidden = false
        } else {
            loadingView.stopAnimating()
            loadingView.isHidden = true
        }
    }
    
    func hideErrorView() {
        errorView.isHidden = true
    }
    
    func showAddButton() {
        addButtonView.layer.cornerRadius = 0.5 * addButtonView.bounds.size.width
        addButtonView.clipsToBounds = true
        addButtonView.addTarget(self, action: #selector(onAddButtonClick), for: .touchUpInside)
        addButtonView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        addButtonView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        addButtonView.layer.shadowOpacity = 1.0
        addButtonView.layer.shadowRadius = 3.0
        addButtonView.layer.masksToBounds = false
    }
    
    @objc func onAddButtonClick() {
        presenter?.userPerformsClickOnAddButton()
    }
}

extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellFactory = cellFactory,
              let user = presenter?.items[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        return cellFactory.getCellView(
            for: collectionView,
            with: user,
            forItemAt: indexPath
        )
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.userPerformsClickOnCell(index: indexPath.row)
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let cellFactory = cellFactory,
              let user = presenter?.items[indexPath.row] else {
            return CGSize.zero
        }

        return cellFactory.getCellSize(for: collectionView, with: user)
    }
}
