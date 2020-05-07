//
//  ViewController.swift
//  AutoLayoutProgramatically
//
//  Created by  alaa alrayes on 5/5/20.
//  Copyright © 2020 alrayes. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    // let's avoid polluting viewDidLoad
    //{} is referred to as closure , and () to call the closure
    let catImg: UIImageView  = {
        //       let imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 150))
        //    let imageView  = UIImageView(image: "pet" )
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "pet")
        
        // this enable autolayout for our imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView : UITextView  = {
        let textView = UITextView()
        
        let attributedText  = NSMutableAttributedString(string: "Join us today in our fun and games", attributes:  [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nready for load and load and i'm happy for that to try and know , just way and you will be happy and enjoy ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.gray ]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false 
        //textView.text = "Join us today in our fun and games"
        // textView.font = UIFont.boldSystemFont(ofSize: 18)
        return textView
        
    }()
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREVIOUS", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
     //   let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink , for: .normal)
        return button
    }()
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
       // pc.pageIndicatorTintColor = .gray
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)

        return pc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(catImg)
        view.addSubview(descriptionTextView)
        
        setupLayout()
        setupBottomControls()
    }
    
    func setupBottomControls(){
        //view.addSubview(previousButton)
        //previousButton.backgroundColor = .red
        
        //        let yellowView = UIView()
        //        yellowView.backgroundColor = .yellow
        //
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        
        let bottomControlsStackViews = UIStackView(arrangedSubviews: [previousButton , pageControl , nextButton])
        bottomControlsStackViews.distribution = .fillEqually
        bottomControlsStackViews.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomControlsStackViews)
        
        NSLayoutConstraint.activate([
            bottomControlsStackViews.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackViews.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackViews.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackViews.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    private func setupLayout(){
        //   let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 150))
        
        let topImageViewContainer = UIView()
        // topImageViewContainer.backgroundColor  = .blue
        view.addSubview(topImageViewContainer)
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        topImageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true  // make the view = half height of the view
        
        topImageViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive  = true
        topImageViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //  topImageViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive  = true
        //  topImageViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive  = true
        
        topImageViewContainer.addSubview(catImg)
        
        //catImg.center = view.center
        catImg.layer.cornerRadius = 10
        catImg.clipsToBounds = true
        catImg.layer.borderWidth = 2.0
        catImg.layer.borderColor = UIColor.red.cgColor
        catImg.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        catImg.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive = true
        // catImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        catImg.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        catImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    
}

