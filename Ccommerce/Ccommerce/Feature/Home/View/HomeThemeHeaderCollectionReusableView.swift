//
//  HomeThemeHeaderCollectionReusableView.swift
//  Ccommerce
//
//  Created by SUNG on 5/8/24.
//

import UIKit

struct HomeThemeHeaderCollectionReusableViewViewModel {
    var headerText: String
}

final class HomeThemeHeaderCollectionReusableView: UICollectionReusableView {
    static let resuableId: String = "HomeThemeHeaderCollectionReusableView"
    @IBOutlet weak var themeHeaderLabel: UILabel!
    
    func setViewModel(_ viewModel: HomeThemeHeaderCollectionReusableViewViewModel) {
        themeHeaderLabel.text = viewModel.headerText
    }
}

