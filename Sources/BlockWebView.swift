//
//  BlockWebView.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

class BlockWebView: UIWebView, UIWebViewDelegate {
    
    var didStartLoad: ((NSURLRequest) -> ())?
    var didFinishLoad: ((NSURLRequest) -> ())?
    var didFailLoad: ((NSURLRequest, NSError) -> ())?
    
    var shouldStartLoadingRequest: ((NSURLRequest) -> (Bool))?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        didStartLoad? (webView.request!)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        didFinishLoad? (webView.request!)
    }
    
    func webView(
        webView: UIWebView,
        didFailLoadWithError error: NSError?) {
            didFailLoad? (webView.request!, error!)
    }
    
    func webView(
        webView: UIWebView,
        shouldStartLoadWithRequest request: NSURLRequest,
        navigationType: UIWebViewNavigationType) -> Bool {
            if let should = shouldStartLoadingRequest {
                return should (request)
            } else {
                return true
            }
    }
    
}


