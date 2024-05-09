//
//  DetailRateView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI

final class DetailRateViewModel: ObservableObject {
    @Published var rate: Int
    
    init(rate: Int) {
        self.rate = rate
    }
}

struct DetailRateView: View {
    @ObservedObject var viewModel: DetailRateViewModel
    
    var body: some View {
        HStack(spacing: 4, content: {
            ForEach(0..<viewModel.rate, id: \.self) { _ in
                starImage
                    .foregroundStyle(CCColor.SwiftUI.yellow)
            }
            ForEach(0..<(5 - viewModel.rate), id: \.self) { _ in
                starImage
                    .foregroundStyle(CCColor.SwiftUI.keyColorGray1)
            }
        })
    }
    
    var starImage: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 16, height: 16)
    }
}

#Preview {
    DetailRateView(viewModel: DetailRateViewModel(rate: 4))
}
