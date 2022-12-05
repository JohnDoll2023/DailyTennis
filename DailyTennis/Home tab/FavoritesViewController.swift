//
//  FavoritesViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit
import WebKit

class FavoritesViewController: UICollectionViewController {
    var webView: WKWebView!
    var favorites: [String] = [
        "6-17-17.mp4",
        "6-18-17.mp4",
        "6-25-17.mp4"
    ]
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("x")
        
//        let html = """
//        <html>
//        <head>
//        <meta name="viewport" content="width=device-width, initial-scale=1">
//        <style> body { font-size: 150%; } </style>
//        </head>
//        <body>
//        <strong>
//        "favorites there"
//        </strong>
//        </body>
//        </html>
//        """
//
//        webView.loadHTMLString(html, baseURL: nil)
    }
    
    // thumbnail loader
    var vvc = VideoViewController()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(favorites.count)
        return favorites.count
    }

    // creates cells in main nav controller view with thumbnail and date
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCell else {
            fatalError("Unable to dequeue FavoritesVideoCell.")
        }
//        cell.imageView.image = UIImage(named: pictures[indexPath.item])
        cell.imageView.image = vvc.generateThumbnail(path: favorites[indexPath.item])
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        // creates cell description
        let str = favorites[indexPath.item]
        let splitEnds = str.components(separatedBy: ".")[0]
        let dateParts = splitEnds.components(separatedBy: "-")
        var titleString = splitEnds
        if (dateParts.count == 3) {
            let month: Int? = Int(dateParts[0])
            let day = dateParts[1]
            let year = dateParts[2]
            let monthstr = Calendar.current.monthSymbols[month! - 1]
            titleString = "\(monthstr) \(day), 20\(year)"
        }
        cell.name.text = titleString
        return cell
    }
    
    // calls detail view controller when a video is tapped, opens up video player
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // set video to url for the cell
            print("here")
            vc.selectedVideo = favorites[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
