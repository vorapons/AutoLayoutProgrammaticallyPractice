//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Vorapon Sirimahatham on 22/6/21.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {

    // let's avoid polluting viewDidload
    let rainbowImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rainbow_header"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit //when rotate screen image will scale down
        
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
       let textView = UITextView()
        textView.text = "Join us today in our fun and games"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let descriptionTextViewByAttributed : UITextView = {
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
    
    // make sure you apply the correct encapsulation principles in your classes
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back",for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next",for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .mainPink
        return  pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // here 's our entry point into our app
//        view.backgroundColor = .yellow
               
        view.addSubview(descriptionTextViewByAttributed)
        setupLayout()
        setupBottomControl()
        
        //imageView.frame = CGRect(x: 0, y: 0, width: 300, height:300)
        //u can use calculation of width height but use autolayout better
    
    }
    
    fileprivate func setupBottomControl() {
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        let grayView = UIView()
//        grayView.backgroundColor = .gray
//
//        let blackView = UIView()
//        blackView.backgroundColor = .black
//
//        let whiteView = UIView()
//        whiteView.backgroundColor = .white
                
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
//            pageControl.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
 
    private func setupLayout() {

        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
//        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // Enable AutoLayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(rainbowImageView)
        
        rainbowImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        rainbowImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        rainbowImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//        rainbowImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        rainbowImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
//        rainbowImageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        rainbowImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextViewByAttributed.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextViewByAttributed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0).isActive = true
        descriptionTextViewByAttributed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0).isActive = true
//        descriptionTextViewByAttributed.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        descriptionTextView.bottomAnchor.constraint(equalTo: descriptionTextView2.topAnchor, constant: 0.0).isActive = true
        
//        descriptionTextView2.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor,constant: 50).isActive = true
//        descriptionTextView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
//        descriptionTextView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
//        descriptionTextView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }


}

