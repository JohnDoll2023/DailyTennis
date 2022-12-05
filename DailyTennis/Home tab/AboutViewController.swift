//
//  AboutViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit

class AboutViewController: UIViewController {
    
    struct Creator {
        var name: String
        var description: String
    }
    
    var creators = [
        Creator(name: "John Doll", description: "You won't find John in many of the videos. John was the camera man for Daily Tennis and preferred to be the one recording rather than the one being recorded. All of the videos were posted to his Snapchat story from beginning to end. Even when John couldn't be there for the filming, he'd share his login with the other guys to make sure that no days were missed."),
        Creator(name: "Austin Hancock", description: "Austin appeared in more Daily Tennis videos than any other cast member. Often willing to do more of the ridiculous stunts and destroy his racquets, he made a name for himself. When Daily Tennis needed someone to come film at any odd hour, Austin was always there."),
        Creator(name: "Curtis Hughes", description: "Curtis is another one of the founding fathers of Daily Tennis. Curtis was regularly the hype man or loud character in the scenes, not afraid to show his emotions for the video. It wouldn't have been Daily Tennis without Curtis."),
        Creator(name: "Jeffrey Adkins", description: "Jeffrey might not have been at the original Daily Tennis videos, but became one of the most reliant members of the crew. He helped to make some of our more special Daily Tennis's, like the split story filmed from Virginia and Ohio.")
    ]
    
    @IBOutlet weak var personNameOutlet: UISegmentedControl!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func nameController(_ sender: UISegmentedControl) {
        switch personNameOutlet.selectedSegmentIndex {
            case 0:
                personImage.image = UIImage(named: creators[0].name)
                nameLabel.text = creators[0].name
                descriptionLabel.text = creators[0].description
            case 1:
                personImage.image = UIImage(named: creators[1].name)
                nameLabel.text = creators[1].name
                descriptionLabel.text = creators[1].description
            case 2:
                personImage.image = UIImage(named: creators[2].name)
                nameLabel.text = creators[2].name
                descriptionLabel.text = creators[2].description
            case 3:
                personImage.image = UIImage(named: creators[3].name)
                nameLabel.text = creators[3].name
                descriptionLabel.text = creators[3].description
            default:
                personImage.image = UIImage(named: creators[0].name)
                nameLabel.text = creators[0].name
                descriptionLabel.text = creators[0].description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personImage.layer.cornerRadius = 20
        switch personNameOutlet.selectedSegmentIndex {
            case 0:
                personImage.image = UIImage(named: creators[0].name)
                nameLabel.text = creators[0].name
                descriptionLabel.text = creators[0].description
            case 1:
                personImage.image = UIImage(named: creators[1].name)
                nameLabel.text = creators[1].name
                descriptionLabel.text = creators[1].description
            case 2:
                personImage.image = UIImage(named: creators[2].name)
                nameLabel.text = creators[2].name
                descriptionLabel.text = creators[2].description
            case 3:
                personImage.image = UIImage(named: creators[3].name)
                nameLabel.text = creators[3].name
                descriptionLabel.text = creators[3].description
            default:
                personImage.image = UIImage(named: creators[0].name)
                nameLabel.text = creators[0].name
                descriptionLabel.text = creators[0].description
        }
    }
}
