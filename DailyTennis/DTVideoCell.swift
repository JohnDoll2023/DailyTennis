//
//  DTVideoCell.swift
//  DailyTennis
//
//  Created by John Doll on 5/20/22.
//

import UIKit

class DTVideoCell: UICollectionViewCell {
    var id = ""
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var favorite: UIButton!
    @IBAction func tapped(_ sender: Any) {
        if (favorite.currentImage == UIImage(systemName: "star")) {
            favorite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            print("added")
            favorites.insert(id);
            print(favorites)
        } else {
            favorite.setImage(UIImage(systemName: "star"), for: .normal)
            favorites.remove(id)
            print("unadded")
            print(favorites)
        }
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(favorites) {
            UserDefaults.standard.set(data, forKey: "favorites")
        }
    }
    @IBOutlet var share: UIButton!
    var favorited = false
}
