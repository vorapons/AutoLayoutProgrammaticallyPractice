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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .cyan
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 150)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
