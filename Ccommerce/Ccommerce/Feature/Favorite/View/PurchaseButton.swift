//
//  PurchaseButton.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import UIKit

final class PurchaseButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = CCColor.keyColorBlue.cgColor
        setTitleColor(CCColor.keyColorBlue, for: .normal)
        setTitle("구매하기", for: .normal)
    }
}
