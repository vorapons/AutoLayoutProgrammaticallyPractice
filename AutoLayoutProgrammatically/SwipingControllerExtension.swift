//
//  SwipingControllerExtension.swift
//  AutoLayoutProgrammatically
//
//  Created by Vorapon Sirimahatham on 23/6/21.
//

import Foundation

import UIKit

extension SwipingController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout() // let cllectionV correct layout when rotate screen
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        } completion: { UIViewControllerTransitionCoordinatorContext in
            // not use
        }
        // there is bug in iX or newer in page0 missing layout on leading side
    }
    
}
