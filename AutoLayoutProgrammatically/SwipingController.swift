//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Vorapon Sirimahatham on 22/6/21.
//

import Foundation
import UIKit

class SwipingController : UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    let pages = [
        Page(imageName: "rainbow_header",
             headerText: "Join us today in our fun and games!",
             bodyText: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.\n1"),
        Page(imageName: "cat1",
             headerText: "Join us today in our fun and games!2",
             bodyText: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.\n2"),
        Page(imageName: "cat2",
             headerText: "Join us today in our fun and games!3",
             bodyText: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.\n3"),
        Page(imageName: "nawhal",
             headerText: "Join us today in our fun and games!4",
             bodyText: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.\n4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .cyan
        //#Example : using default cell class
//      collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        // using their own design class for cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        let page = pages[indexPath.item]
//        let imageName = imageNames[indexPath.item]
//        cell.rainbowImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextViewByAttributed.text = page.headerText
        // #Example
        // How to add view to cell and Page Control
        // definitely don't try this, it is a very bad idea
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        // Correct way is define view in cell by set their own class then adjust data in cell
        cell.page = page

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
