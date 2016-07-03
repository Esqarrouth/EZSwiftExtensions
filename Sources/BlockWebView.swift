//
//  BlockWebView.swift
//
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

#if os(iOS)

///Make sure you use  "[weak self] (NSURLRequest) in" if you are using the keyword self inside the closure or there might be a memory leak
public class BlockWebView: UIWebView, UIWebViewDelegate {
    public var didStartLoad: ((URLRequest) -> ())?
    public var didFinishLoad: ((URLRequest) -> ())?
    public var didFailLoad: ((URLRequest, NSError) -> ())?

    public var shouldStartLoadingRequest: ((URLRequest) -> (Bool))?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    public func webViewDidStartLoad(_ webView: UIWebView) {
        didStartLoad? (webView.request!)
    }

    public func webViewDidFinishLoad(_ webView: UIWebView) {
        didFinishLoad? (webView.request!)
    }

    public func webView(_ webView: UIWebView, didFailLoadWithError error: NSError?) {
        didFailLoad? (webView.request!, error!)
    }

    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let should = shouldStartLoadingRequest {
            return should (request)
        } else {
            return true
        }
    }
}

#endif
