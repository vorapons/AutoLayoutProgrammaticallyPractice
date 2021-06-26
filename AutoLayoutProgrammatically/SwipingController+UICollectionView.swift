//
//  SwipingController+UICollectionView.swift
//  AutoLayoutProgrammatically
//
//  Created by Vorapon Sirimahatham on 23/6/21.
//

import Foundation
import UIKit

extension SwipingController {
    

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
