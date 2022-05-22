//
//  HistoryViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit
import WebKit

class HistoryViewController: UIViewController {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; font-family: Kohinoor Gujarati} </style>
        </head>
        <body>
        <strong>
        It started on a summer night in June before junior year when our high school installed stadium lights around the courts. Over time, it evolved into an all out production. On my Snapchat, we would post ridiculous videos of us doing something tennis related, and we'd get hundreds of views and loads of people saying that they loved the content. We gained so much traction that teachers started requesting to be on it, then our principal, then the principals at the next school over, then our superintendent, and arguably our biggest celebrity: our city mayor. I amassed so many followers in a short period of time, and not just from Wapak, but around the world. I have followers from every continent now (except Antarctica). We had our own merchandise (two different shirts which sold nearly 100 units) and a whole page in the yearbook. The show ended the summer before my senior year, so we ran for about a year logging about 200 clips. It was certainly an incredible time. It was so incredible that when applying for college, my admissions representative actually wrote back regarding Daily Tennis as it had caught his attention.
        </strong>
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
    }
}
