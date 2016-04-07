//
//  BlockWebView.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

///Make sure you use  "[weak self] (NSURLRequest) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockWebView: UIWebView, UIWebViewDelegate {
    public var didStartLoad: ((NSURLRequest) -> ())?
    public var didFinishLoad: ((NSURLRequest) -> ())?
    public var didFailLoad: ((NSURLRequest, NSError) -> ())?

    public var shouldStartLoadingRequest: ((NSURLRequest) -> (Bool))?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    public func webViewDidStartLoad(webView: UIWebView) {
        didStartLoad? (webView.request!)
    }

    public func webViewDidFinishLoad(webView: UIWebView) {
        didFinishLoad? (webView.request!)
    }

    public func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        didFailLoad? (webView.request!, error!)
    }

    public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let should = shouldStartLoadingRequest {
            return should (request)
        } else {
            return true
        }
    }
}
