//
//  FavoriteViewModel.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import Foundation

final class FavoriteViewModel {
    enum Action {
        case getFavoriteFromAPI
        case getFavoriteSuccess(FavoritesResponse)
        case getFavoriteFail(Error)
        case didTapPurchaseButton
        
    }
    
    final class State {
        @Published var tableViewModel: [FavoriteItemTableViewCellViewModel]?
    }
    
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    
    func process(_ action: Action) {
        switch action {
        case .getFavoriteFromAPI:
            getFavoriteFromAPI()
        case .getFavoriteSuccess(let favoritesResponse):
            translateFavoriteItemViewModel(favoritesResponse)
        case .getFavoriteFail(let error):
            print(error)
        case .didTapPurchaseButton:
            break
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension FavoriteViewModel {
    private func getFavoriteFromAPI() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getFavoriteData()
                process(.getFavoriteSuccess(response))
            } catch {
                process(.getFavoriteFail(error))
            }
        }
    }
    
    private func translateFavoriteItemViewModel(_ response: FavoritesResponse) {
        state.tableViewModel = response.favorites.map {
            FavoriteItemTableViewCellViewModel(imageUrl: $0.imageUrl,
                                               productName: $0.title,
                                               productPrice: $0.discountPrice.moneyString)
        }
    }
}
