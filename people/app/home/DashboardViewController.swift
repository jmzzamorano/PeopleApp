//
//  DashboardViewController.swift
//  people
//
//  Created by Javier Martinez Zamorano on 17/9/22.
//

import UIKit

class DashboardViewController: UIViewController, DashboardScreen {
    let presenter = AppConfig.shared.container?.resolve(DashboardPresenter.self)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerTitleView: UILabel!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorTitleView: UILabel!
    @IBOutlet weak var addButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.bind(screen: self, navigator: self)
    }
    
    func showUsers(users: [UserItem]) {
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
        if (isLoading) {
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

extension DashboardViewController: DashboardScreenNavigator {
    
    func navigateToDetailScreen(user: UserItem) {
        guard let navController = self.navigationController else {
            return
        }
        
        Navigator.shared.navigateToDetailScreen(navController: navController, user: user)
    }
    
    func navigateToAddUserScreen() {
        guard let navController = self.navigationController else {
            return
        }
        
        Navigator.shared.navigateToAddUserScreen(navController: navController)
    }
}


extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.currentUsers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = presenter?.currentUsers[indexPath.row]
        
        let cell = MediumCellView.dequeueCell(collectionView: collectionView, indexPath: indexPath)
        cell?.bind(user: user)
        
        return cell!
    }
    
    func registerAvailableCellTypes() {
        MediumCellView.registerForCollectionView(collectionView: collectionView)
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {        
        presenter?.userPerformsClickOnCell(index: indexPath.row)
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        return CGSize(width: width, height: MediumCellView.height)
    }
}

extension DashboardViewController {
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
