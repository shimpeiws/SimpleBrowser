//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Shimpei Takamatsu on 2016/04/30.
//  Copyright © 2016年 shimpeiws. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    let homeUrl = "https://www.google.co.jp"
    
    let whiteList = [
        "https?://*\\.google\\.co\\.jp",
        "https?://*\\.google\\.com",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        openUrl(homeUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openUrl(urlString: String) {
        let url = NSURL(string: urlString)
        let urlRequest = NSURLRequest(URL: url!)
        webView.loadRequest(urlRequest)
    }
    
    func openUrlInSafari(urlString: String) {
        if let nsUrl = NSURL(string: urlString) {
            UIApplication.sharedApplication().openURL(nsUrl)
        }
    }
    
    func stopLoading() {
        activityIndicator.alpha = 0
        activityIndicator.stopAnimating()
        backButton.enabled = webView.canGoBack
        reloadButton.enabled = true
        stopButton.enabled = false
    }
    
    // MARK: - UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.alpha = 1
        activityIndicator.startAnimating()
        backButton.enabled = false
        reloadButton.enabled = false
        stopButton.enabled = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        stopLoading()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.Other {
            return true;
        }
        
        var theUrl: String
        if let unwrappedUrl = request.URL?.absoluteString {
            theUrl = unwrappedUrl
        } else {
            stopLoading()
            return false;
        }
        
        var canStayInApp = false;
        for url in whiteList {
            if let match = theUrl.rangeOfString(url, options: NSStringCompareOptions.RegularExpressionSearch) {
                canStayInApp = true;
                break;
            }
        }
        
        if !canStayInApp {
            openUrlInSafari(theUrl)
            stopLoading()
            return false;
        }
        
        return true
    }
    
    // MARK: - IBAction
    @IBAction func backButtonTapped(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func reloadButtonTapped(sender: UIBarButtonItem) {
        webView.reload()
    }
    
    
    @IBAction func stopButtonTapped(sender: UIBarButtonItem) {
        webView.stopLoading()
    }

}

