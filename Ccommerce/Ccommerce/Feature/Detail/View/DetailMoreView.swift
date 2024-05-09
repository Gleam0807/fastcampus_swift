//
//  DetailMoreView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI

final class DetailMoreViewModel: ObservableObject {
    
}

struct DetailMoreView: View {
    @ObservedObject var viewModel: DetailMoreViewModel
    var onMoreTapped: () -> Void
    
    var body: some View {
        Button {
            onMoreTapped()
        } label: {
            HStack(alignment: .center, spacing: 10, content: {
                Text("상품정보 더보기")
                    .font(CCFont.SwiftUI.b17)
                    .foregroundStyle(CCColor.SwiftUI.keyColorBlue)
                Image(.down)
                    .foregroundStyle(CCColor.SwiftUI.keyColorGray2)
            })
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .border(CCColor.SwiftUI.keyColorBlue, width: 1)
        }
    }
}

#Preview {
    DetailMoreView(viewModel: DetailMoreViewModel(), onMoreTapped: {})
}
