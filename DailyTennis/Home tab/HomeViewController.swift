//
//  HomeViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit
import AVKit
import SwiftUI

class HomeViewController: UICollectionViewController {
    
    
    var videos: [String] = [
        "6-17-17.mp4",
        "6-18-17.mp4",
        "6-23-17.mp4",
        "6-25-17.mp4",
        "6-29-17.mp4",
        "7-28-17.mp4",
        "7-30-17.mp4",
        "8-1-17.mp4",
        "8-2-17.mp4",
        "8-6-17.mov",
        "8-7-17.mp4",
        "8-8-17.mp4",
        "8-9-17.mp4",
        "8-10-17.mp4",
        "8-12-17.mp4",
        "8-14-17.mp4",
        "8-17-17.mp4",
        "8-18-17.mp4",
        "8-19-17.mov",
        "8-20-17.mp4",
        "8-26-17.mp4",
        "9-10-17.mp4",
        "9-15-17.mp4",
        "9-29-17.mp4",
        "11-26-17.mp4",
        "11-28-17.mp4",
        "12-3-17.mp4",
        "12-10-17.mp4",
        "12-15-17.mov",
        "12-17-17.mp4",
        "1-7-18.mp4",
        "1-8-18.mp4",
        "1-14-18.mov",
        "1-15-18.mp4",
        "1-16-18.mp4",
        "1-21-18.mov",
        "1-28-18.mp4",
        "2-4-18.mov",
        "2-18-18.mp4",
        "2-22-18.mp4",
        "2-23-18.mp4",
        "2-24-18.mp4",
        "2-25-18.mp4",
        "2-26-18-celeb-1.mp4",
        "2-27-18-celeb-1.mov",
        "2-28-18-celeb-1.mov",
        "3-1-18-celeb-1.mp4",
        "3-2-18-celeb-1.mp4",
        "3-4-18.mp4",
        "3-5-18.mp4",
        "3-7-18.mp4",
        "3-8-18.mp4",
        "3-9-18.mp4",
        "3-11-18.mp4",
        "3-12-18.mov",
        "3-13-18.mov",
        "3-14-18.mp4",
        "3-15-18.mp4",
        "3-16-18.mp4",
        "3-17-18.mp4",
        "3-18-18.mp4",
        "3-19-18.mp4",
        "3-20-18.mp4",
        "3-21-18.mp4",
        "3-22-18.mp4",
        "3-23-18.mp4",
        "3-24-18.mp4",
        "3-25-18.mp4",
        "3-26-18.mp4",
        "3-28-18.mp4",
        "3-30-18.mp4",
        "3-31-18.mov",
        "4-1-18.mov",
        "4-3-18.mp4",
        "4-4-18.mp4",
        "4-6-18.mp4",
        "4-8-18.mp4",
        "4-9-18.mp4",
        "4-10-18.mp4",
        "4-11-18.mp4",
        "4-12-18.mp4",
        "4-13-18.mp4",
        "4-14-18.mov",
        "4-15-18.mp4",
        "4-16-18.mp4",
        "4-17-18.mov",
        "4-18-18.mp4",
        "4-19-18.mp4",
        "4-20-18.mp4",
        "4-21-18.mp4",
        "4-22-18.mov",
        "4-23-18.mov",
        "4-24-18.mp4",
        "4-25-18.mp4",
        "4-26-18.mp4",
        "4-27-18.mp4",
        "4-28-18.mp4",
        "4-29-18.mp4",
        "4-30-18.mp4",
        "5-1-18.mp4",
        "5-2-18.mp4",
        "5-3-18.mp4",
        "5-4-18.mp4",
        "5-5-18.mp4",
        "5-6-18.mp4",
        "5-7-18.mp4",
        "5-8-18.mp4",
        "5-9-18.mp4",
        "5-10-18.mp4",
        "5-11-18.mp4",
        "5-12-18.mp4",
        "5-13-18.mp4",
        "5-14-18.mp4",
        "5-15-18.mp4",
        "5-16-18.mp4",
        "5-17-18.mp4",
        "5-18-18.mp4",
        "5-19-18.mp4",
        "5-20-18.mp4",
        "5-21-18-celeb-2.mp4",
        "5-22-18-celeb-2.mp4",
        "5-24-18-celeb-2.mp4",
        "5-25-18-celeb-2.mp4",
        "5-26-18.mp4",
        "5-27-18.mp4",
        "5-28-18-exchange.mp4",
        "5-29-18-exchange.mov",
        "5-30-18-exchange.mp4",
        "5-31-18-exchange.mp4",
        "6-1-18-exchange.mp4",
        "6-2-18.mp4",
        "6-3-18.mp4",
        "6-4-18.mp4",
        "6-5-18.mp4",
        "6-6-18.mp4",
        "6-7-18.mp4",
        "6-8-18.mp4",
        "6-9-18.mp4",
        "6-12-18.mp4",
        "6-18-18-sports.mp4",
        "6-19-18-sports.mp4",
        "6-20-18-sports.mp4",
        "6-21-18-sports.mp4",
        "6-22-18-sports.mp4",
        "6-23-18-sports.mp4",
        "6-24-18.mp4",
        "6-25-18.mp4",
        "6-26-18.mp4",
        "6-27-18.mp4",
        "6-28-18.mp4",
        "6-29-18.mp4",
        "6-30-18.mp4",
        "7-1-18.mp4",
        "7-2-18.mp4",
        "7-4-18.mp4",
        "7-5-18.mp4",
        "7-6-18.mp4",
        "7-15-18.mp4",
        "7-16-18.mp4",
        "7-17-18.mp4",
        "7-18-18.mp4",
        "7-19-18.mp4",
        "7-20-18.mp4",
        "1-30-19.mov",
        "2-24-19.mp4",
        "3-25-19-celeb-3.mp4",
        "3-26-19-celeb-3.mp4",
        "3-27-19-celeb-3.mp4",
        "3-28-19-celeb-3.mp4",
        "3-29-19-celeb-3.mp4",
        "mechanicssuck.MOV",
    ]
    
    var vvc = VideoViewController()
    
    lazy var featured: String = vvc.videos.randomElement()!
    let fvc = FavoritesViewController()
    lazy var favorite: String = fvc.favorites[0]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // gotta make back button say home but dont want navbar coming up
//        title = "Home"
//        navigationController?.navigationBar.isHidden = true
        if (!defaults.bool(forKey: "agreeToEULA")) {
            agreement()
        }
        
        
        
        DispatchQueue.global(qos: .userInteractive).async {
//        queue.async(group: group) {
            for video in self.videos {
                if thumbnailDict[video] == nil {
                    thumbnailDict[video] = self.generateThumbnail(path: video)
                }
            }
        }
//        }
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        leftSwipe.direction = .left


        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func handleSwipes(sender:UISwipeGestureRecognizer) {
//        if (sender.direction == .left) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "VideoViewController") as! UICollectionViewController
//            self.present(vc, animated: false, completion: nil)
//        }
//
//        if (sender.direction == .right) {

//        }
        self.tabBarController?.selectedIndex += 1
    }
    
    // user agreement alert
    @objc func agreement() {
//        let attributedString = NSMutableAttributedString(string: "Link to Agreement")
//        attributedString.addAttribute(.link, value:
//        "https://johnmdoll.com/projects/dailytennis/dailytennisEULA.html", range: NSRange(location: 0, length: 16))
        
        let ac = UIAlertController(title: "By tapping \"I Agree\", you agree to the EULA provided at the source below", message: "https://johnmdoll.com/projects/dailytennis/dailytennisEULA.html", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "I Agree", style: .default))
        present(ac, animated: true)
        defaults.set(true, forKey: "agreeToEULA")
        
    }
    
    // thumbnail generator that doesn't reload the view continously
    func generateThumbnail(path: String) -> UIImage? {
        do {
            let imgGenerator = AVAssetImageGenerator(asset: AVURLAsset(url: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(path)")!, options: nil))
            imgGenerator.appliesPreferredTrackTransform = true
            return UIImage(cgImage: try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil))
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }

    // sets number of tabs on home screen
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
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
            cell.imageView.image = generateThumbnail(path: featured)
            
            return cell
            
            // favorites cell in lower right (might be bottom mid in future)
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath as IndexPath) as? FavoritesCell else {
                fatalError("Unable to dequeue FavoritesCell.")
            }
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
            cell.imageView.layer.cornerRadius = 20
            cell.imageView.image = generateThumbnail(path: favorites.randomElement() ?? "6-17-17.mp4")
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
            return cell
        }
    }
    
    // determines which view controller to return based on view tapped
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.item) {
            case 0:
                
                let vc = AboutViewController()
//                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = HistoryViewController()
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = DetailViewController()
                vc.selectedVideo = featured
                navigationController?.pushViewController(vc, animated: true)
            case 3:
//                if let vc = storyboard?.instantiateViewController(withIdentifier: "Favorites") as? FavoritesViewController {
//                    print("here12")
//                    navigationController?.pushViewController(vc, animated: true)
//                }
                let vc = FavoritesViewController()
                print("wgd")
                navigationController?.pushViewController(vc, animated: true)
            default:
                
                let vc = AboutViewController()
                navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
