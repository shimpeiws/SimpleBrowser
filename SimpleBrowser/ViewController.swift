//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Shimpei Takamatsu on 2016/04/30.
//  Copyright © 2016年 shimpeiws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    let homeUrl = "https://www.google.co.jp"

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
    
    @IBAction func backButtonTapped(sender: UIBarButtonItem) {
    }
    
    @IBAction func reloadButtonTapped(sender: UIBarButtonItem) {
    }
    
    
    @IBAction func stopButtonTapped(sender: UIBarButtonItem) {
    }

}

