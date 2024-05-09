//
//  DetailPriceView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI

final class DetailPriceViewModel: ObservableObject {
    @Published var discountRate: String
    @Published var originPrice: String
    @Published var currentPrice: String
    @Published var shippingType: String
    
    init(discountRate: String, originPrice: String, currentPrice: String, shippingType: String) {
        self.discountRate = discountRate
        self.originPrice = originPrice
        self.currentPrice = currentPrice
        self.shippingType = shippingType
    }
}

struct DetailPriceView: View {
    @ObservedObject var viewModel: DetailPriceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21, content: {
            VStack(alignment: .leading, spacing: 6, content: {
                HStack(spacing: 0, content: {
                    Text(viewModel.discountRate)
                        .font(CCFont.SwiftUI.b14)
                        .foregroundStyle(CCColor.SwiftUI.keyColorGray2)
                    Text(viewModel.originPrice)
                        .font(CCFont.SwiftUI.b16)
                        .strikethrough()
                        .foregroundStyle(CCColor.SwiftUI.keyColorGray1)
                })
                Text(viewModel.currentPrice)
                    .font(CCFont.SwiftUI.b20)
                    .foregroundStyle(CCColor.SwiftUI.keyColorRed)
            })
            Text(viewModel.shippingType)
                .font(CCFont.SwiftUI.r12)
                .foregroundStyle(CCColor.SwiftUI.keyColorGray2)
        })
    }
}

#Preview {
    DetailPriceView(viewModel: DetailPriceViewModel(discountRate: "53%",
                                                    originPrice: "300,000원",
                                                    currentPrice: "139,000원",
                                                    shippingType: "무료배송"))
}
