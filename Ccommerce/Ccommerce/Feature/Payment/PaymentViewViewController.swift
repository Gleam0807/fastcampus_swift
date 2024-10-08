//
//  PaymentViewViewController.swift
//  Ccommerce
//
//  Created by SUNG on 5/13/24.
//

import UIKit
import WebKit

class PaymentViewViewController: UIViewController {
    private var webView: WKWebView? // 결제화면은 웹뷰로 구현

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView?.load(URLRequest(url: URL(string: "https://google.co.kr")!))
    }
}

#Preview {
    PaymentViewViewController()
}
