//
//  SubmitEventsViewController.swift
//  FoodTruck
//
//  Created by Jada White on 6/29/21.
//
// "On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import UIKit
import WebKit

class SubmitEventsViewController: UIViewController, WKNavigationDelegate {
    
    let webView = WKWebView()
    
    override func loadView() {
        // Makes web view fullscreen
        self.view = webView
        // Locks web view only to Google Calendar New Event input page
        webView.navigationDelegate = self
    }
    
}

extension WKWebView {
    func load(_ urlString: String) {
        // Loads Google Calendar New Event input page to web view
        if let gCalURL = URL(string: "https://calendar.google.com/calendar/u/0?cid=Y192YmJoMnUwMDZscjFuOGk1dDI2dHB0MDVuNEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t") {
            let request = URLRequest(url: gCalURL)
            load(request)
        }
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction; WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        if let hostWebsite = navigationAction.request.url?.host {
//            if hostWebsite == "https://calendar.google.com/calendar/u/0/r/eventedit" {
//                decisionHandler(.allow)
//                return
//            }
//        }
//
//        decisionHandler(.cancel)
//    }
}
