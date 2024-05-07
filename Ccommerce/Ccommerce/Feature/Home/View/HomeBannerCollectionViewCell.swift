//
//  HomeBannerCollectionViewCell.swift
//  Ccommerce
//
//  Created by SUNG on 5/2/24.
//

import UIKit
import Kingfisher

struct HomeBannerCollectionViewCellViewModel: Hashable {
    let bannerImageUrl: String
}

class HomeBannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setViewMoel(_ viewModel: HomeBannerCollectionViewCellViewModel) {
        imageView.kf.setImage(with: URL(string: viewModel.bannerImageUrl))
    }
}

extension HomeBannerCollectionViewCell {
    static func bannerLayout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
