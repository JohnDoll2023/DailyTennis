//
//  DetailViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/20/22.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    var selectedVideo: URL?
    var videoPlayer: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // turn on audio
//        try! AVAudioSession.sharedInstance().setCategory(.playback)
//
//        if let url = selectedVideo {
//            // specify url of video
//            let player = AVPlayer(url: url)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            // play video
//            self.present(playerViewController, animated: true) {
//                playerViewController.player!.play()
//
//            }
//        }
        // Do any additional setup after loading the view.
    }
    
    // the video player
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       if let url = selectedVideo {
           videoPlayer = AVPlayer(url: url)
           let playerLayer = AVPlayerLayer(player: videoPlayer)
           let playerViewController = AVPlayerViewController()
           playerViewController.player = videoPlayer
           playerLayer.frame = self.view.bounds
           playerViewController.showsPlaybackControls = true
           try! AVAudioSession.sharedInstance().setCategory(.playback)
           
           // creates view inside detailviewcontroller and then plays video
           self.view.layer.addSublayer(playerLayer)
           videoPlayer.play()
           
           // cannot be used when the above two lines are not commented out, allows for playback controls but blocks the nav controller
//           self.present(playerViewController, animated: true) {
//               playerViewController.player!.play()
//
//           }
       }
        // calls videoDidEnd method to return to main nav controller
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        // might want to use if i can set playback nicely
//        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)
    }
    
    @objc func videoDidEnd(notification: NSNotification) {
        // make it so that when the video ends, it takes just a second to go back to main screen
        usleep(750_000)
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        tabBarController?.tabBar.isHidden = false
    }
}
