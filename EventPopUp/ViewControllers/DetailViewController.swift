//
//  DetailViewController.swift
//  EventPopUp
//
//  Created by Chris Kim on 9/15/22.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var webView: WKWebView!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWeb()
    }
    
    
    // MARK: - Load Website
    
    private func loadWeb() {
        guard let url = URL(string: "https://naver.com") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
