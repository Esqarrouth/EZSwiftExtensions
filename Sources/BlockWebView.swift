//
//  BlockWebView.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

#if os(iOS)

///Make sure you use  `[weak self] (NSURLRequest) in` if you are using the keyword `self` inside the closure or there might be a memory leak
open class BlockWebView: UIWebView, UIWebViewDelegate {
    open var didStartLoad: ((URLRequest) -> Void)?
    open var didFinishLoad: ((URLRequest) -> Void)?
    open var didFailLoad: ((URLRequest, Error) -> Void)?

    open var shouldStartLoadingRequest: ((URLRequest) -> (Bool))?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open func webViewDidStartLoad(_ webView: UIWebView) {
        didStartLoad? (webView.request!)
    }

    open func webViewDidFinishLoad(_ webView: UIWebView) {
        didFinishLoad? (webView.request!)
    }

    open func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        didFailLoad? (webView.request!, error)
    }

    open func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let should = shouldStartLoadingRequest {
            return should (request)
        } else {
            return true
        }
    }
}

#endif
