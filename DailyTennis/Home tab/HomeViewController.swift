//
//  HomeViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var vvc = VideoViewController()
    lazy var featured: String = vvc.videos.randomElement()!
    let fvc = FavoritesViewController()
    lazy var favorite: String = fvc.favorites[0]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // sets number of tabs on home screen
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    // sets each individual set
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // About cell in upper left
        if (indexPath.item == 0) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "About", for: indexPath as IndexPath) as? AboutCell else {
                fatalError("Unable to dequeue AboutCell.")
            }
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.cornerRadius = 20
            return cell
            
            // History cell in upper right
        } else if (indexPath.item == 1) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "History", for: indexPath as IndexPath) as? HistoryCell else {
                fatalError("Unable to dequeue HistoryCell.")
            }
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.cornerRadius = 20
            return cell
            
            // featured cell in lower left (might be mid center in future)
        } else if (indexPath.item == 2) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Featured", for: indexPath as IndexPath) as? FeaturedCell else {
                fatalError("Unable to dequeue FeaturedCell.")
            }
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.cornerRadius = 20
            cell.imageView.image = vvc.generateThumbnail(path: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(featured)")!)
            return cell
            
            // favorites cell in lower right (might be bottom mid in future)
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath as IndexPath) as? FavoritesCell else {
                fatalError("Unable to dequeue FavoritesCell.")
            }
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.cornerRadius = 20
            cell.imageView.image = vvc.generateThumbnail(path: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(favorite)")!)
            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.layer.borderWidth = 2
            return cell
        }
    }
    
    // determines which view controller to return based on view tapped
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.item) {
            case 0:
                let vc = AboutViewController()
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = HistoryViewController()
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = DetailViewController()
                vc.selectedVideo = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(featured)")
                navigationController?.pushViewController(vc, animated: true)
            default:
                if let vc = storyboard?.instantiateViewController(withIdentifier: "Favorites") as? FavoritesViewController {
                    print("here12")
                    navigationController?.pushViewController(vc, animated: true)
                }
        }
        
    }
}
