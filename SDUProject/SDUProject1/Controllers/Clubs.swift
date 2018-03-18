//
//  ClubViewController.swift
//  SDU
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

private let reuseIdentifier = "clubs"
protocol GTSendDelegate{
    var intex:Int{get set}
}
class Clubs: UICollectionViewController,GTSendDelegate {
    
    let clubImages = [#imageLiteral(resourceName: "club0"),#imageLiteral(resourceName: "club1"),#imageLiteral(resourceName: "club2"),#imageLiteral(resourceName: "club4"),#imageLiteral(resourceName: "club5"),#imageLiteral(resourceName: "club6"),#imageLiteral(resourceName: "club7")]
    let clubNames = ["Академик клуб"," ART Club","Debate club","Домбыра club","Education club","Sana IQ Club"," UNITY Dance Club",]
    var intex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/3 - 1

        return CGSize(width: width , height:width )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return clubImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubsIdentifire", for: indexPath) as! Clubs_Cell
        cell.clubName.text = clubNames[indexPath.row]
        cell.clubImage.image = clubImages[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        intex = indexPath.row
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AboutClubSeque" {
            let desination = segue.destination as! AboutClubViewController
            desination.delegates = self
            
            
        }
    }
    

}
