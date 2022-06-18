//
//  DTVideoCell.swift
//  DailyTennis
//
//  Created by John Doll on 5/20/22.
//

import UIKit

class DTVideoCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var favorite: UIButton!
    @IBAction func tapped(_ sender: Any) {
        favorite.setImage(UIImage(named: "star.fill"), for: UIControl.State.normal)
    }
    @IBOutlet var share: UIButton!
    var favorited = false
}
