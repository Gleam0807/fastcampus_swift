//
//  HomeViewModel.swift
//  Ccommerce
//
//  Created by SUNG on 5/7/24.
//

import Foundation
import Combine

final class HomeViewModel {
    enum Action {
        case loadData
        case loadCoupon
        case getDataSuccess(HomeResponse)
        case getDataFail(Error)
        case getCouponSuccess(Bool)
        case didTapCouponButton
    }
    
    final class State {
        struct CollectionViewModels {
            var bannerViewModels: [HomeBannerCollectionViewCellViewModel]?
            var horizontalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var couponState: [HomeCouponButtonCollectionViewCellViewModel]?
            var verticalProductViewModels: [HomeProductCollectionViewCellViewModel]?
            var separateLine1ViewModels: [HomeSperateLineCollectionViewCellViewModel] = [HomeSperateLineCollectionViewCellViewModel()]
            var separateLine2ViewModels: [HomeSperateLineCollectionViewCellViewModel] = [HomeSperateLineCollectionViewCellViewModel()]
            var themeViewModels: (headerViewModel: HomeThemeHeaderCollectionReusableViewViewModel, items: [HomeThemeCollectionViewCellViewModel])?
        }
        @Published var collectionViewModels: CollectionViewModels = CollectionViewModels()
    }
    
    private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    private let couponDownloadedKey: String = "CouponDownloaded"
    
    func process(action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .loadCoupon:
            loadCoupon()
        case let .getDataSuccess(response):
            transformResponses(response)
        case let .getDataFail(error):
            print("network error: \(error)")
        case let .getCouponSuccess(isDownloaded):
            Task { await transformCoupon(isDownloaded) }
        case .didTapCouponButton:
            downloadCoupon()
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}
extension HomeViewModel {
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
    
    private func loadCoupon() {
        let couponState: Bool = UserDefaults.standard.bool(forKey: couponDownloadedKey)
        process(action: .getCouponSuccess(couponState))
    }
    
    private func transformResponses(_ response: HomeResponse) {
        Task { await transformBanner(response) }
        Task { await transformHorizontalProduct(response) }
        Task { await transformVerticalProduct(response) }
        Task { await transformTheme(response) }
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
    
    @MainActor
    private func transformTheme(_ response: HomeResponse) async {
        let items = response.themes.map {
            HomeThemeCollectionViewCellViewModel(themeImageUrl: $0.imageUrl)
        }
        
        state.collectionViewModels.themeViewModels = (HomeThemeHeaderCollectionReusableViewViewModel(headerText: "테마관"), items)
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
    
    @MainActor
    private func transformCoupon(_ isDownloaded: Bool) {
        state.collectionViewModels.couponState = [.init(state: isDownloaded ? .disable : .enable)]
    }
    
    private func downloadCoupon() {
        UserDefaults.standard.setValue(true, forKey: couponDownloadedKey)
        process(action: .loadCoupon)
    }
}
