//
//  ViewController.swift
//  UICollectionViewController
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    fileprivate let cellId = "resultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pass the layout object
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    // NUM
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .purple
        
        
        return cell
    }
    
    init() {
        // Flow layout object
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

