//
//  detailWebView.swift
//  SwiftUITest
//
//  Created by 王涛 on 2021/7/29.
//  Copyright © 2021 王涛. All rights reserved.
//

import SwiftUI
import WebKit
import ProgressHUD

struct WebViewPage : UIViewRepresentable {
    @Binding var listModel:ListModel
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        return webView
    }
    /// 设置代理对象
    /// - Returns: 对象
    func makeCoordinator() -> webDelegate {
        return webDelegate()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: listModel.link)!)
        uiView.navigationDelegate = context.coordinator
        uiView.load(req)
        ProgressHUD.show()
    }
}
public class webDelegate: NSObject,WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ProgressHUD.dismiss()
        ProgressHUD.showError("网页加载失败")
        
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ProgressHUD.dismiss()
    }
}
