//
//  HomeViewController.swift
//  DailyTennis
//
//  Created by John Doll on 5/21/22.
//

import UIKit

//private let reuseIdentifier = "Cell"

class HomeViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "About", for: indexPath) as? AboutCell else {
//            fatalError("Unable to dequeue AboutCell.")
//        }
//        cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//        cell.layer.borderWidth = 2
//
//        // Configure the cell
//
//        return cell
        if (indexPath.item == 0) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "About", for: indexPath as IndexPath) as? AboutCell else {
                fatalError("Unable to dequeue AboutCell.")
            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
    //        cell.layer.borderWidth = 2
            cell.imageView.layer.masksToBounds = true
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
    //        cell.imageView.layer.borderWidth = 2
            cell.imageView.layer.cornerRadius = 20
//            cell.imageView.image
//            cell.imageView.layer
            
            // Configure the cell
        
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "History", for: indexPath as IndexPath) as? HistoryCell else {
                fatalError("Unable to dequeue HistoryCell.")
            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
            cell.imageView.layer.masksToBounds = true
            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
    //        cell.imageView.layer.borderWidth = 2
            cell.imageView.layer.cornerRadius = 20
            
            return cell
        }
//        else if (indexPath.item == 2) {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Featured", for: indexPath as IndexPath) as? FeaturedCell else {
//                fatalError("Unable to dequeue FeaturedCell.")
//            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
//            cell.imageView.layer.masksToBounds = true
//            cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//    //        cell.imageView.layer.borderWidth = 2
//            cell.imageView.layer.cornerRadius = 20
//            let x = VideoViewController()
//            print(x.thumbnails.count)
//            cell.imageView.image = x.thumbnails.randomElement()
//            return cell
//        } else {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath as IndexPath) as? FavoritesCell else {
//                fatalError("Unable to dequeue FavoritesCell.")
//            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
//
//            return cell
//        }
    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        if (indexPath.item == 0) {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "About", for: indexPath as IndexPath) as? AboutCell else {
//                fatalError("Unable to dequeue AboutCell.")
//            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
//
//            // Configure the cell
//
//            return cell
//
//        } else {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "History", for: indexPath as IndexPath) as? HistoryCell else {
//                fatalError("Unable to dequeue HistoryCell.")
//            }
//            cell.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
//            cell.layer.borderWidth = 2
//
//            return cell
//        }
//                if((indexPath.row + 1) < self.players.count){ //If index of cell is less than the number of players then display the player
//
//                        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("yourIdentifierForAddedPlayerCell", forIndexPath: indexPath) as! AddedPlayerCell
//                        cell.labelText.text = self.players[indexPath.row] //Display player
//                        return cell;
//
//                }else{//Else display DefaultCell
//                        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("yourIdentifierForDefaultCell", forIndexPath: indexPath) as! DefaultCell
//                        cell.labelText.text = "Add"
//                        return cell;
//                }
//    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if (navigationController?.tabBarItem.)
        if (indexPath.item == 0) {
            let vc = AboutViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = HistoryViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
//        else if (indexPath.item == 2) {
//            let vc = FeaturedViewController()
//            navigationController?.pushViewController(vc, animated: true)
//        } else {
//            let vc = FavoritesViewController()
//            navigationController?.pushViewController(vc, animated: true)
//        }
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
