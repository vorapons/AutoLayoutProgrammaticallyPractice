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

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x // get end draging point
        print(x,view.frame.width, x / view.frame.width)
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .cyan
        //#Example : using default cell class
//      collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        // using their own design class for cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        setupBottomControl()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
  
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back",for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrevious() {
        print("Trying to advanc to previous")
        let previousIndex = pageControl.currentPage > 0 ? pageControl.currentPage - 1 : 0
        pageControl.currentPage = previousIndex
        let indexPath = IndexPath(item:previousIndex,section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next",for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        print("Trying to advanc to next")
        let nextIndex = pageControl.currentPage < (pages.count - 1) ? pageControl.currentPage + 1 :  pages.count - 1
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item:nextIndex,section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    // Note : local var can't access class member so using 'lazy' keyword
    // Note2: Remove private to let class extension ease to access
    //    private lazy var pageControl : UIPageControl = {
    lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .mainPink
        return  pc
    }()
   
    fileprivate func setupBottomControl() {
                
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.distribution = .fillProportionally
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
