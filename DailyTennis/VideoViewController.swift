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
//            DispatchQueue.main.async {
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
    
//    let thumbnailCache = NSCache<NSURL, UIImage>()
    var thumbnailDict = [String:UIImage]()
    
    // holds the thumbnails for the videos
//    var thumbnails = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Daily Tennis"
        navigationController?.tabBarItem.title = "Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
//        print(videos.count)
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
        DispatchQueue.global(qos: .userInteractive).async {
            for video in self.videos {
    //            print("here")
                
                if self.thumbnailDict[video] == nil {
                    print(video)
                    self.thumbnailDict[video] = self.generateThumbnail(path: video)
                }
    //            print("here2")
            }
        }
        
    }
    
    // thumbnail loader
    func generateThumbnail(path: String) -> UIImage? {
        if thumbnailDict.index(forKey: path) != nil {
            return thumbnailDict[path]
        }
//        if let imageFromCache = thumbnailCache.object(forKey: path as NSURL) {
//            return imageFromCache
//        }
        do {
            let asset = AVURLAsset(url: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(path)")!, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
//            thumbnailCache.setObject(thumbnail, forKey: path as NSURL)
            thumbnailDict[path] = thumbnail
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
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
//        cell.imageView.image = generateThumbnail(path: videos[indexPath.item])
//        print(thumbnailDict[videos[indexPath.item]])
        print("video: \(videos[indexPath.item])")
        if thumbnailDict[videos[indexPath.item]] == nil {
            DispatchQueue.global(qos:.userInitiated).async {
                print("its working \(indexPath.item)")
                self.thumbnailDict[self.videos[indexPath.item]] = self.generateThumbnail(path: self.videos[indexPath.item])
//                    DispatchQueue.main.async {
//                        collectionView.reloadData()
//                    }
//                collectionView.performSelector(onMainThread: #selector(collectionView.reloadData), with: <#T##Any?#>, waitUntilDone: <#T##Bool#>)
            }
        }
        cell.imageView.image = thumbnailDict[videos[indexPath.item]]
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        // creates cell description
        let str = videos[indexPath.item]
        let splitEnds = str.components(separatedBy: ".")[0]
        let dateParts = splitEnds.components(separatedBy: "-")
        var titleString = splitEnds
        if (dateParts.count >= 3) {
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
            vc.selectedVideo = videos[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
