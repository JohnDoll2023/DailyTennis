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
    // all daily tennis videos
    var videos: [String] = [
        "6-17-17.mp4",
        "6-18-17.mp4",
//        "6-25-17.mp4",
//        "6-29-17.mp4",
//        "9-15-17.mp4",
//        "7-28-17.mp4",
//        "7-30-17.mp4",
//        "8-1-17.mp4",
//        "8-2-17.mp4",
//        "9-15-17.mp4",
//        "1-21-18.mov",
//        "mechanicssuck.MOV",
//        "shoppingcart.mov"
    ]
    
    // holds the thumbnails for the videos
    var thumbnails = [UIImage]()
//    var thumbnailView: UIImageView!
//    var pictures = [String]()
//    var dtimage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Daily Tennis"
        navigationController?.tabBarItem.title = "Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
            for video in self.videos {
                let url = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(video)")
    //            print("here")
                self.thumbnails.append(self.generateThumbnail(path: url!)!)
    //            print("here2")
            }
//        }
//        let url = URL(string: videoURL)
//        thumbnails.append(generateThumbnail(path: url!)!)
        
    }
    
    // thumbnail loader
    func generateThumbnail(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
//            print(thumbnail)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    // other thumbnail loader
//    func getThumbnail(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
//        let asset = AVAsset(url: url)
//        print("here2")
//        let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
//        avAssetImageGenerator.appliesPreferredTrackTransform = true
//        let thumbnailTime = CMTimeMake(value: 1, timescale: 1)
//        do {
//            let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
//            let thumbImage = UIImage(cgImage: cgThumbImage)
//            print(thumbImage)
//            completion(thumbImage)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(pictures.count)
        return videos.count
    }

    // creates cells in main nav controller view with thumbnail and date
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DTVideo", for: indexPath) as? DTVideoCell else {
            // we failed to get a PersonCell – bail out!
            fatalError("Unable to dequeue DTVideoCell.")
        }
//        cell.imageView.image = UIImage(named: pictures[indexPath.item])
        cell.imageView.image = thumbnails[indexPath.item]
        cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//        cell.layer.borderWidth = 2
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 50
        let str = videos[indexPath.item]
//        let parts = str.components(separatedBy: "/")
//        let end = parts[3]
        let splitEnds = str.components(separatedBy: ".")[0]
//        let date = splitEnds[0]
        let dateParts = splitEnds.components(separatedBy: "-")
//        let month: Int? = Int(dateParts[0])
//        let day = dateParts[1]
//        let year = dateParts[2]
        var titleString = splitEnds
//        guard let month: Int? = Int(dateParts[0]) {
//            guard let day = dateParts[1]? else {
//                guard let year = dateParts[2]? {
//                    let monthstr = Calendar.current.monthSymbols[month! - 1]
//                    titleString = "\(monthstr) \(day), 20\(year)"
//                } else {
//                    titleString = "daily tennis"
//
//                }
//            } else {
//                titleString = "daily tennis"
//
//            }
//        } else {
//            titleString = "daily tennis"
//        }
        if (dateParts.count == 3) {
            let month: Int? = Int(dateParts[0])
            let day = dateParts[1]
            let year = dateParts[2]
            let monthstr = Calendar.current.monthSymbols[month! - 1]
            titleString = "\(monthstr) \(day), 20\(year)"
        }
//        let monthstr = Calendar.current.monthSymbols[month! - 1]
//        print("Day: \(day), Month: \(monthstr), Year: \(year)")
        
//        cell.name.center.x = view.centerXAnchor
//        cell.name.text = "\(monthstr) \(day), 20\(year)"
        cell.name.text = titleString
        cell.name.center.x = self.view.center.x
//        cell.name.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cell.name.textAlignment = .center
        

        cell.layer.cornerRadius = 7
        
        // if we're still here it means we got a PersonCell, so we can return it
        return cell
    }
    
    // calls detail view controller when a video is tapped, opens up video player
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // set video to url for the cell
            vc.selectedVideo = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(videos[indexPath.item])")
//            vc.videoTitle = "Video \(indexPath.row + 1)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

