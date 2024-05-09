//
//  OptionRootView.swift
//  Ccommerce
//
//  Created by SUNG on 5/9/24.
//

import SwiftUI

struct OptionRootView: View {
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text("옵션")
    }
}

#Preview {
    OptionRootView(viewModel: OptionViewModel())
}
