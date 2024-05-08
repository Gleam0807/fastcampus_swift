//
//  HomeViewModel.swift
//  Ccommerce
//
//  Created by SUNG on 5/7/24.
//

import Foundation
import Combine

class HomeViewModel {
    enum Action {
        case loadData
        case getDataSuccess(HomeResponse)
        case getDataFail(Error)
    }
    
    final class State {
        struct CollectionViewModels {
            var bannerViewModels: [HomeBannerCollectionViewCellViewModel]?
            var horizontalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var verticalProductViewModels: [HomeProductCollectionViewCellViewModel]?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
        case let .getDataSuccess(response):
            transformResponses(response)
        case let .getDataFail(error):
            print("network error: \(error)")
        }
    }
    
    private func loadData() {
        loadDataTask = Task {
            do {
                let response = try await NetworkService.shared.getHomeData()
                process(action: .getDataSuccess(response))
            } catch {
                process(action: .getDataFail(error))
            }
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
    
    private func transformResponses(_ response: HomeResponse) {
        Task { await transformBanner(response) }
        Task { await transformHorizontalProduct(response) }
        Task { await transformVerticalProduct(response) }
    }
    
    @MainActor
    private func transformBanner(_ response: HomeResponse) async {
        state.collectionViewModels.bannerViewModels = response.banners.map {
            HomeBannerCollectionViewCellViewModel(bannerImageUrl: $0.imageUrl)
        }
    }
    
    @MainActor
    private func transformHorizontalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.horizontalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.horizontalProducts)
    }
    
    @MainActor
    private func transformVerticalProduct(_ response: HomeResponse) async {
        state.collectionViewModels.verticalProductViewModels = productToHomeProductCollectionViewCellViewModel(response.verticalProducts)
    }
    
    private func productToHomeProductCollectionViewCellViewModel(_ product: [Product]) -> [HomeProductCollectionViewCellViewModel] {
        return product.map {
            HomeProductCollectionViewCellViewModel(imageUrlString: $0.imageUrl,
                                                   title: $0.title,
                                                   reasonDiscountString: $0.discount,
                                                   originalPrice: $0.originalPrice.moneyString,
                                                   discountPrice: $0.discountPrice.moneyString)
        }
    }
}
