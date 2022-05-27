//
//  DetailViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/20/22.
//

import UIKit
import AVKit
import SwiftUI
import MessageUI
import ContactsUI

class DetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    var selectedVideo: String?
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
        if let url = URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(selectedVideo ?? "")") {
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
        
        // report button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(report))
        
        // calls videoDidEnd method to return to main nav controller
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        // might want to use if i can set playback nicely
//        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemPlaybackStalled, object: nil)
    }
    
    // report function sends email to me when user decides they want to send report
    @objc func report() {
        let ac = UIAlertController(title: "Report", message: "Would you like to report this video for objectionable content?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Yes", style: .default) {_ in
            
            // create email UI
            if MFMailComposeViewController.canSendMail() {
                let splitEnds = self.selectedVideo!.components(separatedBy: ".")[0]
                let dateParts = splitEnds.components(separatedBy: "-")
                var titleString = splitEnds
                if (dateParts.count >= 3) {
                    let month: Int? = Int(dateParts[0])
                    let day = dateParts[1]
                    let year = dateParts[2]
                    let monthstr = Calendar.current.monthSymbols[month! - 1]
                    titleString = "\(monthstr) \(day), 20\(year)"
                }
                
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self //as? MFMailComposeViewControllerDelegate
                mail.setToRecipients(["me@johnmdoll.com"])
                mail.setSubject("Objectionable video in Daily Tennis app")
                mail.setMessageBody("The daily tennis video from \(titleString) needs review for objectionable content.", isHTML: true)
                self.present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send email")
            }
            
            // should close out email UI when user makes decision
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: NSError?) {
                // Check the result or perform other tasks.
                
                // Dismiss the mail compose view controller.
                controller.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            
            
        })
        ac.addAction(UIAlertAction(title: "No", style: .default))
        present(ac, animated: true)
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
