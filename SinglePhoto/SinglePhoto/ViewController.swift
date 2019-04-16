//
//  ViewController.swift
//  SinglePhoto
//
//  Created by Enrique on 2019-04-15.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nextButton: UIButton!
    
    // iOS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let width = view.frame.size.width / 2 - 50
        let height = view.frame.height / 2 - 50
        nextButton = UIButton(frame: CGRect(x: width, y: height, width: 100, height: 100))
        nextButton.setTitle("NEXT", for: .normal)
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
    }
    
    @objc func pushToNextVC () {
        let nextVC = NewViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnTap(_ sender: UIButton) {
        print("I press the button btnTap!")
    }
    
}

