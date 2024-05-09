//
//  DetailPurchaseView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI

final class DetailPurchaseViewModel: ObservableObject {
    @Published var isFavorite: Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}

struct DetailPurchaseView: View {
    @ObservedObject var viewModel: DetailPurchaseViewModel
    var onFavoriteTapped: () -> Void
    var onPurchaseTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 30, content: {
            Button(action: onFavoriteTapped, label: {
                viewModel.isFavorite ? Image(.favoriteOn) : Image(.favoriteOff)
            })
            Button(action: onPurchaseTapped, label: {
                Text("구매하기")
                    .font(CCFont.SwiftUI.m16)
                    .foregroundColor(CCColor.SwiftUI.wh)
            })
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(CCColor.SwiftUI.keyColorBlue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        })
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    DetailPurchaseView(viewModel: DetailPurchaseViewModel(isFavorite: true), onFavoriteTapped: {}, onPurchaseTapped: {})
}
