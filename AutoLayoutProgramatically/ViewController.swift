//
//  ViewController.swift
//  AutoLayoutProgramatically
//
//  Created by  alaa alrayes on 5/5/20.
//  Copyright © 2020 alrayes. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(catImg)
        view.addSubview(descriptionTextView)
        
        setupLayout()
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

