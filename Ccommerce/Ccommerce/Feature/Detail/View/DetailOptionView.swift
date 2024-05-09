//
//  DetailOptionView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI
import Kingfisher

final class DetailOptionViewModel: ObservableObject {
    @Published var type: String
    @Published var name: String
    @Published var imageUrl: String
    
    init(type: String, name: String, imageUrl: String) {
        self.type = type
        self.name = name
        self.imageUrl = imageUrl
    }
}

struct DetailOptionView: View {
    @ObservedObject var viewModel: DetailOptionViewModel
    
    var body: some View {
        HStack(spacing: 0, content: {
            VStack(alignment: .leading, spacing: 4, content: {
                Text(viewModel.type)
                    .foregroundStyle(CCColor.SwiftUI.keyColorGray4)
                    .font(CCFont.SwiftUI.r12)
                Text(viewModel.name)
                    .foregroundStyle(CCColor.SwiftUI.bk)
                    .font(CCFont.SwiftUI.b14)
            })
            Spacer()
            KFImage(URL(string: viewModel.imageUrl))
                .resizable()
                .frame(width: 40, height: 40)
        })
    }
}

#Preview {
    DetailOptionView(viewModel: DetailOptionViewModel(type: "색상", name: "코랄", imageUrl: "https://picsum.photos/id/1/500/500"))
}
