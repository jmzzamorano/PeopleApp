//
//  MediumCellView.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import UIKit
import Kingfisher

class MediumCellView: UICollectionViewCell {
    static let reuseId = "medium_cell"
    static let height = 168.0
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var teamTitleView: UILabel!
    @IBOutlet weak var descriptionTitleView: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var profileHolderView: UIView!
    
    static func registerForCollectionView(collectionView: UICollectionView) {
        let nibName = String(describing: self)
        
        var nib: UINib?
        nib = UINib.init(nibName: nibName, bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: reuseId)
    }
    
    static func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> MediumCellView? {
        return collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath
        ) as? MediumCellView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(user: UserItem?) {
        guard let user = user else {
            return
        }
        
        customizeUserInfo(user: user)
        customizeBackgroundPlaceHolder()
        customizeProfileImage(image: user.image)
        customizeBackgroundContainer()
    }
    
    private func customizeUserInfo(user: UserItem) {
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
