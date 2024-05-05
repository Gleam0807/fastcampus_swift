//
//  HomeViewController.swift
//  Ccommerce
//
//  Created by SUNG on 5/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    enum Section: Int {
        case banner
        case horizontalProductItem
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    private var compositinalLayout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout {section, _ in
            switch Section(rawValue: section) {
            case .banner:
                let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                return section
            case .horizontalProductItem:
                let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(117), heightDimension: .estimated(224))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 20, leading: 33, bottom: 0, trailing: 33)
                return section
            case .none: return nil
            }
            
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, viewModel in
            switch Section(rawValue: indexPath.section) {
            case .banner:
                guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
                      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell
                else { return .init() }
                cell.setViewMoel(viewModel)
                return cell
            case .horizontalProductItem:
                guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
                      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell
                else { return .init() }
                cell.setViewModel(viewModel)
                return cell
            case .none:
                return .init()
            }
        })
        /// snapShot
        var snapShot: NSDiffableDataSourceSnapshot<Section, AnyHashable> =
        NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapShot.appendSections([.banner])
        snapShot.appendItems([
            HomeBannerCollectionViewCellViewModel(bannerImage: .slide1),
            HomeBannerCollectionViewCellViewModel(bannerImage: .slide2),
            HomeBannerCollectionViewCellViewModel(bannerImage: .slide3)], toSection: .banner)
        
        snapShot.appendSections([.horizontalProductItem])
        snapShot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation1", reasonDiscountString: "쿠폰 할인", originalPrice: "100000", discountPrice: "80000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation2", reasonDiscountString: "쿠폰 할인", originalPrice: "200000", discountPrice: "180000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation3", reasonDiscountString: "쿠폰 할인", originalPrice: "300000", discountPrice: "280000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation4", reasonDiscountString: "쿠폰 할인", originalPrice: "400000", discountPrice: "380000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation5", reasonDiscountString: "쿠폰 할인", originalPrice: "500000", discountPrice: "480000")], toSection: .horizontalProductItem)
        dataSource?.apply(snapShot)
        
        collectionView.collectionViewLayout = compositinalLayout
    }
}

//#Preview {
//    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
//}
