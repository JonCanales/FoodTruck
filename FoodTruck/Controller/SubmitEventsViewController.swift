//
//  SubmitEventsViewController.swift
//  FoodTruck
//
//  Created by Jada White on 6/29/21.
// "On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import UIKit
import WebKit

class SubmitEventsViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        // Makes web view fullscreen
        webView = WKWebView()
        // Locks web view only to Google Calendar New Event input page
        webView.navigationDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        if let gCal = URL(string: "https://calendar.google.com/calendar/embed?src=c_vbbh2u006lr1n8i5t26tpt05n4%40group.calendar.google.com&ctz=America%2FNew_York") {
            webView.load(URLRequest(url: gCal))
        }
    }
    
}
