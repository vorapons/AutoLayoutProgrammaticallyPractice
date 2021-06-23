//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Vorapon Sirimahatham on 23/6/21.
//

import Foundation
import UIKit

class PageCell : UICollectionViewCell{
    
    override init( frame : CGRect ) {
        super.init( frame: frame )
        setupLayout()
    }
    
    var page : Page? {
        didSet {
            // #Example
            // Bad Solution in unwarpped process
//            rainbowImageView.image = UIImage(named: page!.imageName)
//            descriptionTextViewByAttributed.text = page!.headerText
            // UIImage requires non-optional string so below is better solution to unwrap
            guard let unwrappedPage = page else { return }
            rainbowImageView.image = UIImage(named: unwrappedPage.imageName)
            descriptionTextViewByAttributed.text = unwrappedPage.headerText
            let attributedText = NSMutableAttributedString(
                                    string: unwrappedPage.headerText,
                                    attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(
                                    string: unwrappedPage.bodyText,
                                    attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),
                                                 NSAttributedString.Key.foregroundColor : UIColor.gray] ))
            
            descriptionTextViewByAttributed.attributedText = attributedText
            descriptionTextViewByAttributed.textAlignment = .center
        }
    }
    
    private let rainbowImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rainbow_header"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit //when rotate screen image will scale down
        return imageView
    }()
    
    private let descriptionTextViewByAttributed : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!",
                                attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(
            string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),
                            NSAttributedString.Key.foregroundColor : UIColor.gray] ))
        
        textView.attributedText = attributedText
        textView.backgroundColor = .clear
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private func setupLayout() {

        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        addSubview(descriptionTextViewByAttributed)

        // Enable AutoLayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(rainbowImageView)
        
        rainbowImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        rainbowImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        rainbowImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextViewByAttributed.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextViewByAttributed.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0).isActive = true
        descriptionTextViewByAttributed.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0).isActive = true
  }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
