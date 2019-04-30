//
//  SearchCollectionViewsCellsCollectionViewController.swift
//  AppStore
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchCollectionViewsCells: UICollectionViewCell {
    
    let iconView: UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .green
        iV.layer.cornerRadius = 20
        iV.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iV.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        return iV
    }()
    
    let nameLabel: UILabel = {
        let nameLb = UILabel()
        nameLb.text = "Instagram"
        
        return nameLb
    }()
    
    let categoryLabel: UILabel = {
        let categoryLb = UILabel()
        categoryLb.text = "Social Network"
        
        return categoryLb
    }()
    
    let ratingLabel: UILabel = {
        let ratingLb = UILabel()
        ratingLb.text = "991K"
        
        return ratingLb
    }()
    
    let getButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("GET", for: .normal)
        butt.setTitleColor(.orange, for: .normal)
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.backgroundColor = UIColor(white: 0.95, alpha: 1)
        butt.widthAnchor.constraint(equalToConstant: 60).isActive = true
        butt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        butt.layer.cornerRadius = 14
        
        return butt
    }()
    
    lazy var screenShot1: UIImageView = createScreenShotImageView()
    lazy var screenShot2: UIImageView = createScreenShotImageView()
    lazy var screenShot3: UIImageView = createScreenShotImageView()
    
    fileprivate func createScreenShotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 10
        
        return iv
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //contentView.backgroundColor = .white
        
        // Add the buttons
        let labelSV = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
            ])
        labelSV.axis = .vertical
        
        let appInfoSV = UIStackView(arrangedSubviews: [
            iconView, labelSV, getButton
            ])
        
        appInfoSV.spacing = 12
        appInfoSV.alignment = .center
        
        // Add the screenShot
        let screenShotSV = UIStackView(arrangedSubviews: [
            screenShot1, screenShot2, screenShot3
            ])
        
        screenShotSV.spacing = 12
        screenShotSV.distribution = .fillEqually
        
        // Another stackView
        let rootStackView = UIStackView(arrangedSubviews: [
            appInfoSV, screenShotSV
            ])
        
        rootStackView.axis = .vertical
        addSubview(rootStackView)
        
        // Create the matchParent view
        rootStackView.matchParent(padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
        // Set the contrain
        appInfoSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appInfoSV.topAnchor.constraint(equalTo: topAnchor),
            appInfoSV.bottomAnchor.constraint(equalTo: bottomAnchor),
            appInfoSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            appInfoSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

