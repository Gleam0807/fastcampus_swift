//
//  PurchaseViewModel.swift
//  Ccommerce
//
//  Created by SUNG on 5/10/24.
//

import Foundation

final class PurchaseViewModel: ObservableObject {
    enum Action {
        case loadData
        case didTapPurchaseButton
    }
    
    struct State {
        var purchaseItems: [PurchaseSelectedItemViewModel]?
    }
    
    @Published private(set) var state: State = State()
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            Task { await loadData() }
        case .didTapPurchaseButton:
            Task { await didTapPurchaseButton() }
        }
    }
}

extension PurchaseViewModel {
    @MainActor
    private func loadData() async {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.state.purchaseItems = [
                PurchaseSelectedItemViewModel(title: "PlayStation1", decription: "수량 1개 / 무료배송"),
                PurchaseSelectedItemViewModel(title: "PlayStation2", decription: "수량 2개 / 무료배송"),
                PurchaseSelectedItemViewModel(title: "PlayStation3", decription: "수량 3개 / 무료배송"),
                PurchaseSelectedItemViewModel(title: "PlayStation4", decription: "수량 4개 / 무료배송"),
                PurchaseSelectedItemViewModel(title: "PlayStation5", decription: "수량 5개 / 무료배송")
            ]
        }
    }
    
    @MainActor
    private func didTapPurchaseButton() async {
        
    }
}
