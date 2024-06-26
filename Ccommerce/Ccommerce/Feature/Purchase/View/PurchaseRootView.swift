//
//  PurchaseRootView.swift
//  Ccommerce
//
//  Created by SUNG on 5/10/24.
//

import UIKit

final class PurchaseRootView: UIView {
    private var scrollViewConstraints: [NSLayoutConstraint]?
    private var titleLabelConstraints: [NSLayoutConstraint]?
    private var purchaseItemStackViewConstraints: [NSLayoutConstraint]?
    private var purchaseButtonConstraints: [NSLayoutConstraint]?
    
    private var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titlelabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "주문 상품 목록"
        label.font = CCFont.UIKit.m17
        label.textColor = CCColor.UIKit.bk
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var purchaseItemStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var purchaseButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(CCColor.UIKit.wh, for: .normal)
        button.titleLabel?.font = CCFont.UIKit.m16
        button.layer.backgroundColor = CCColor.UIKit.keyColorBlue.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if scrollViewConstraints == nil {
            let constaints = [
                scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: purchaseButton.topAnchor),
                
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ]
            NSLayoutConstraint.activate(constaints)
            scrollViewConstraints = constaints
        }
        
        if titleLabelConstraints == nil, let superView = titlelabel.superview {
            let constaints = [
                titlelabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 33),
                titlelabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 33),
                titlelabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constaints)
            titleLabelConstraints = constaints
        }
        
        if purchaseItemStackViewConstraints == nil, let superView = purchaseItemStackView.superview {
            let constaints = [
                purchaseItemStackView.topAnchor.constraint(equalTo: titlelabel.topAnchor, constant: 19),
                purchaseItemStackView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20),
                purchaseItemStackView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20),
                purchaseItemStackView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -33)
            ]
            NSLayoutConstraint.activate(constaints)
            purchaseItemStackViewConstraints = constaints
        }
        
        if purchaseButtonConstraints == nil {
            let constaints = [
                purchaseButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
                purchaseButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
                purchaseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
                purchaseButton.heightAnchor.constraint(equalToConstant: 50)
            ]
            NSLayoutConstraint.activate(constaints)
            purchaseItemStackViewConstraints = constaints
        }
        
        super.updateConstraints()
    }
    
    private func commonInit() {
        addSubViews()
    }
    
    private func addSubViews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titlelabel)
        containerView.addSubview(purchaseItemStackView)
        addSubview(purchaseButton)
    }
    
    func setPurchaseItem(_ viewModels: [PurchaseSelectedItemViewModel]) {
        purchaseItemStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        viewModels.forEach {
            purchaseItemStackView.addArrangedSubview(PurchaseSelectedItemView(viewModel: $0))
        }
    }
}
