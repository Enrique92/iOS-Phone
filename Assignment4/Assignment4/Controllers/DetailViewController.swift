//
//  ViewController.swift
//  Assignment4
//
//  Created by Enrique on 2019-04-24.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city: City!
    
    let labelCityName: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 28.0)!
        label.font.withSize(30)
        return label
    }()
    
    let labelCityTemp: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 28.0)!
        return label
    }()
    
    let labelCitySummary: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 28.0)!
        return label
    }()
    
    let labelCityIcon: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 28.0)!
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add to the view the elements
        view.addSubview(labelCityName)
        view.addSubview(labelCityTemp)
        view.addSubview(labelCitySummary)
        view.addSubview(labelCityIcon)
        
        labelCityName.text = city.name
        labelCityTemp.text = String(city.temperature)
        labelCitySummary.text = city.summary
        labelCityIcon.text = city.icon
        
        // Add the layout
        NSLayoutConstraint.activate([
            labelCityName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCityName.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            ])
        
        NSLayoutConstraint.activate([
            labelCityTemp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCityTemp.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
            ])
        
        NSLayoutConstraint.activate([
            labelCitySummary.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCitySummary.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7),
            ])
        
        NSLayoutConstraint.activate([
            labelCityIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCityIcon.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.9),
            ])
    }
}

