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
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false 
        textView.text = "Join us today in our fun and games"
        return textView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
          view.addSubview(catImg)
        view.addSubview(descriptionTextView)

            setupLayout()
    }
    
    private func setupLayout(){
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 150))
        catImg.center = view.center
            catImg.layer.cornerRadius = 10
            catImg.clipsToBounds = true
            catImg.layer.borderWidth = 2.0
            catImg.layer.borderColor = UIColor.red.cgColor
        

          catImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          catImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //  imageV.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          catImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
          catImg.heightAnchor.constraint(equalToConstant: 150).isActive = true

        
        descriptionTextView.topAnchor.constraint(equalTo:catImg.bottomAnchor , constant: 150).isActive = true
        
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }


}

