//
//  ViewController.swift
//  AssignmentStarter
//
//  Created by Enrique on 2019-04-17.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Create a main view
    let mainView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        return v
    }()
    
    let purpleBox: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .purple
        return v
    }()
    
    let blueStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews:
        UIView(), blueBoxView(), blueBoxView(), blueBoxView(), UIView())
        v.axis = .center
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        return v
    }()
    
    let redView: UIView = {
        // Create the red view
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        
        // Create the minisquares
        let orangeView1 = UIView(frame: CGRect(x: 10, y: 10, width: 140, height: 60))
        orangeView1.backgroundColor = .orange
        let orangeView2 = UIView(frame: CGRect(x: 160, y: 10, width: 90, height: 60))
        orangeView2.backgroundColor = .orange
        
        // Add the squares to the big one
        v.addSubview(orangeView1)
        v.addSubview(orangeView2)
        return v
    }()
    
    fileprivate func setUpBlueStackView () {
        addSubView(blueStackView)
        NSLayoutConstraint.activate([
            blueStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blueStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    fileprivate func setUpRedView () {
        addSubView(redView)
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
        redView.anchorSize(width: 200, height: 60)
    }
    
    // Button object
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTagged), for: .touchUpInside)
        return butt
    }()
    
    // Button object
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTagged), for: .touchUpInside)
        return butt
    }()
    
    // Button object
    let landscapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landScapeTagged), for: .touchUpInside)
        return butt
    }()
    
    fileprivate func blueBoxView() -> UIView {
    let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        // Call the extension
        v.anchorSize(width: 80, height: 80)
        return v
    }
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    
    fileprivate func setLayout() {
        // Get the superview's layout
        //let margins = mainView.layoutMarginsGuide
        
        // Set the constrain for the main View(X and Y, width and height)
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Assign the width anchor to the Layout
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        widthAnchor?.isActive = true
        
        // Assign the height anchor to the Layout
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        heightAnchor?.isActive = true
        
        // PurpleBox width and height
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
        purpleBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12).isActive = true
        purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12).isActive = true
        
        // BlueBox 1
//        blueBox1.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1).isActive = true
//        blueBox1.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        blueBox1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 80).isActive = true
//        blueBox1.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0).isActive = true
//
//        // BlueBox 2
//        blueBox2.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1).isActive = true
//        blueBox2.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        blueBox2.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0).isActive = true
//        blueBox2.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0).isActive = true
//
//        // BlueBox 3
//        blueBox3.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.1).isActive = true
//        blueBox3.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        blueBox3.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -80).isActive = true
//        blueBox3.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0).isActive = true
        
        
        // StackView with all the buttons
        let buttStackView = UIStackView(arrangedSubviews: [squareButton, portraitButton, landscapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.distribution = .fillEqually
        buttStackView.alignment = .center
        
        // Add the stackView
        view.addSubview(buttStackView)
        
        // Bottom
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Apply the color to the background
        view.backgroundColor = .white
        
        // Add the other view to the main one
        view.addSubview(mainView)
        
        // Add the items
        mainView.addSubview(purpleBox)
//        mainView.addSubview(blueBox1)
//        mainView.addSubview(blueBox2)
//        mainView.addSubview(blueBox3)
        
        
        // Call the method
        setLayout()
        
    }
    
    @objc private func squareTagged() {
        // Main view
        // Call the method
        view.layoutIfNeeded()
        
        // Change the contraint properties
        UIView.animate(withDuration: 2.0) {
            // Add the animation
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            
            // We must call the method view.layoutIfNeeded(using self before always)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTagged() {
        // Main view
        // Call the method
        view.layoutIfNeeded()
        
        // Change the contraint properties
        UIView.animate(withDuration: 2.0) {
            // Add the animation
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            
            // We must call the method view.layoutIfNeeded(using self before always)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func landScapeTagged() {
        // Main view
        // Call the method
        view.layoutIfNeeded()
        
        // Change the contraint properties
        UIView.animate(withDuration: 2.0) {
            // Add the animation
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            
            // We must call the method view.layoutIfNeeded(using self before always)
            self.view.layoutIfNeeded()
        }
    }
}

extension UIView {
    func anchorSize(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

