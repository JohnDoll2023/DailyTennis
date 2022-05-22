//
//  AboutViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
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
        My friends and I started this whole trend as a way to keep ourselves accountable and paly tennis everyday leading up to our next season. Austin, the guy featured in the first video, is in nearly every single Daily Tennis often accompanied by co-stars Curtis and Jeffrey. Several other people would make appearences from our team or from our school, or other schools... I, John, was the videographer for nearly every Daily Tennis. I didn't quite save all of them in the beginning of the show because we didn't expect much from it. But now, 5 years later, I am nearly finished with computer science degree from Miami University. Instead of having to search for and find these in my Snapchat memories whenever I think about it or someone requests one, they'll all be available here. I plan to implement several features to make finding your favorites or the favorites of others easier as the app continues to develop. I want the videos to be able to be shared easily, just as they were when we originally filmed them.
        </strong>
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
    }
}
