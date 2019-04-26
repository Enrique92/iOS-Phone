//
//  CityViewController.swift
//  Assignment4
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

    let goDetailButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setTitle("Go see details", for: .normal)
        butt.backgroundColor = UIColor.white
        butt.titleLabel?.font =  UIFont(name: "HelveticaNeue-Thin", size: 20)
        butt.layer.cornerRadius = 10.0
        butt.addTarget(self, action: #selector(showDetailVC), for: .touchUpInside)
        
        return butt
    }()
    
    @objc private func showDetailVC() {
        // screen width and height
//        let width = UIScreen.main.bounds.size.width
//        let height = UIScreen.main.bounds.size.height
//        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
//        imageViewBackground.image = UIImage(named: "background")
//
//        // you can change the content mode:
//        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        let detailVC = DetailViewController()
        detailVC.city = city
        detailVC.view.backgroundColor = .white
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // Dependency injection
    var city: City! {
        didSet {
            // Add the city to the tab bar item
            tabBarItem = UITabBarItem(title: city.name, image: UIImage(named: city.icon), selectedImage: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add to the title the name of each city
        navigationItem.title = city.name
        
        // Add like a subView
        view.addSubview(goDetailButton)
        
        // Add the layout
        NSLayoutConstraint.activate([
            goDetailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goDetailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
