//
//  ViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/20/22.
//

import UIKit
import AVKit

class VideoViewController: UICollectionViewController {
    
//    let videoURL = "https://dailytennis.s3.us-east-2.amazonaws.com/1-21-18.mov"
    
//    func loadImageUsingUrlString(urlString: String) {
//        let url = URL(string: urlString)
//        URLSession.shared.dataTask(with: url!, completionHandler: {
//            (data, response, error) in
//            if error != nil {
////                print(error)
//                return
//            }
////            DispatchQueue.main.async {
//            print(data!)
//                let imageToCache = UIImage(data: data!)
////                imageCache.setObject(imageToCache!, forKey: url!)
////            print (imageToCache)
//                self.imageCache.append(imageToCache!)
//                self.image = imageToCache!
////            }
//        }).resume()
//    }
    // all daily tennis videos
    var videos: [String] = [
        "6-17-17.mp4",
        "6-18-17.mp4",
        "6-25-17.mp4",
        "6-29-17.mp4",
        "9-15-17.mp4",
        "7-28-17.mp4",
        "7-30-17.mp4",
        "8-1-17.mp4",
        "8-2-17.mp4",
        "9-15-17.mp4",
        "1-21-18.mov",
        "mechanicssuck.MOV",
        "shoppingcart.mov"
    ]
    
    let thumbnailCache = NSCache<NSURL, UIImage>()
    
    // holds the thumbnails for the videos
//    var thumbnails = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Daily Tennis"
        navigationController?.tabBarItem.title = "Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
//        loadImageUsingUrlString(urlString: videoURL)
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//        for item in items {
//            if item.hasPrefix("nssl") {
//                // this is picture to load
//                self.pictures.append(item)
//            }
//        }
//        let url = URL(string: videoURL)
//        self.getThumbnail(url: url!) { (thumbImage) in
//            self.dtimage = thumbImage
//        }
//        for video in videos {
//            let url = URL(string: video)
//            self.getThumbnail(url: url!) { (thumbImage) in
//                print("here")
//                self.thumbnails.append(thumbImage!)
//            }
//        }
        
        // loads thumbnails
//        DispatchQueue.global().async {
//            for video in self.videos {
//                let url = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(video)")
//    //            print("here")
//                self.thumbnails.append(self.generateThumbnail(path: url!)!)
//    //            print("here2")
//            }
//        }
        
    }
    
    // thumbnail loader
    func generateThumbnail(path: URL) -> UIImage? {
        if let imageFromCache = thumbnailCache.object(forKey: path as NSURL) {
            return imageFromCache
        }
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            thumbnailCache.setObject(thumbnail, forKey: path as NSURL)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    // creates cells in main nav controller view with thumbnail and date
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DTVideo", for: indexPath) as? DTVideoCell else {
            fatalError("Unable to dequeue DTVideoCell.")
        }
//        cell.imageView.image = UIImage(named: pictures[indexPath.item])
        cell.imageView.image = generateThumbnail(path: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(videos[indexPath.item])")!)
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        // creates cell description
        let str = videos[indexPath.item]
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
            vc.selectedVideo = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(videos[indexPath.item])")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
